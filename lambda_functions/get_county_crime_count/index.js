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
    query = knex.raw('SELECT count(*) crime_count, max(completed_college.lat) lat, max(completed_college.lon) lon, agencies.county from agencies join nibrs_incident on agencies.agency_id = nibrs_incident.agency_id join nibrs_offense on nibrs_offense.incident_id = nibrs_incident.incident_id join completed_college on completed_college.county = agencies.county group by agencies.county having agencies.county = :county;', params)
  } else {
    query = knex.raw('SELECT count(*) crime_count, max(completed_college.lat) lat, max(completed_college.lon) lon, agencies.county from agencies join nibrs_incident on agencies.agency_id = nibrs_incident.agency_id join nibrs_offense on nibrs_offense.incident_id = nibrs_incident.incident_id join completed_college on completed_college.county = agencies.county group by agencies.county;')
  }
  let crime_count = (await query).rows;
  const response = {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET"
      },
      body: JSON.stringify(crime_count)
  };
  return response;
};
