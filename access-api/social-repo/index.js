const app = require('./src/app')

const pool = require('./src/pool')

pool.connect({
  host: 'localhost',
  port: 5432,
  database: 'socialnet',
  user: 'postgres',
  password: '',
}).then(() => {
  app().listen(3005,() => console.log('listening on 3005'));
}).catch((err) => {
  console.log(err.message);
})
