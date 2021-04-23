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
    query = knex.raw('SELECT _2015_2019 percent_college_graduates, county, lat, lon from completed_college where county = :county;', params)
  } else {
    query = knex.raw('SELECT _2015_2019 percent_college_graduates, county, lat, lon from completed_college;')
  }
  let college_graduates = (await query).rows;
  const response = {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET"
      },
      body: JSON.stringify(college_graduates)
  };
  return response;
};
