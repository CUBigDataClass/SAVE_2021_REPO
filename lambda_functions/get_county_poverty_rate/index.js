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
    query = knex.raw('SELECT percent, p.county, lat, lon from poverty_report p join completed_college c on p.county = c.county where p.county=:county;', params)
  } else {
    query = knex.raw('SELECT percent, p.county, lat, lon from poverty_report p join completed_college c on p.county = c.county;')
  }
  let poverty_rate = (await query).rows;
  const response = {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET"
      },
      body: JSON.stringify(poverty_rate)
  };
  return response;
};
