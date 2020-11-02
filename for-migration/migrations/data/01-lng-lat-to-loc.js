const pg = require('pg');

const pool = new pg.Pool({
  host: 'localhost',
  port: 5432,
  database: 'socialnet',
  user: 'postgres',
  password: '',
});

pool.query(`
    update posts
    set loc = point(lng,lat)
    where loc is null
`).then(() => {
    console.log('update complete');
    pool.end()
}).catch((err) => {
  console.log(err.message);
})
