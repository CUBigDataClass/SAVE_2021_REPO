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

  let counties = await knex('completed_college').whereNot('county', 'Colorado').select('county', 'lat', 'lon');
  const response = {
      statusCode: 200,
      body: JSON.stringify(counties)
  };
  return response;
};
