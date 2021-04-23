exports.handler = async (event) => {
  const knex = require('knex')({
    client: 'pg',
    connection: {
      host : process.env.host,
      user : process.env.username,
      password : process.env.password,
      database : process.env.database
    },
    acquireConnectionTimeout: 20000,
    pool: { min: 0, max: 2 }
  });

  let county = event?.pathParameters?.county;
  let query;
  if (county) {
    county = decodeURI(county)
    const params = {
      county
    }
    query = knex.raw('select e.median_household_income_2019 income, c.lat, c.lon, c.county from employment_report e join completed_college c on e.county = c.county where c.county = :county;', params)
  } else {
    query = knex.raw('select (e.median_household_income_2019-(select min(median_household_income_2019) from employment_report))/((select max(median_household_income_2019) from employment_report)-(select min(median_household_income_2019) from employment_report)) income, c.lat, c.lon from employment_report e join completed_college c on e.county = c.county;')
  }
  let income = (await query).rows;
  const response = {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET"
      },
      body: JSON.stringify(income)
  };
  return response;
};
