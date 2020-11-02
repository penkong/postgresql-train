const pool =require('../pool');
const toCamelCase = require('./utils/toCamelCase')

// option 1
// module.exports  = {
//   find() {},
//   findById() {},
//   insert() {}
// }

// option 2
class UserRepo {
  static async find() {
    const { rows } = await pool.query(`select * from users`);
    return toCamelCase(rows);
  }

  static async findById(id) {
    // with this pattern first build prepare pattern sql
    const {rows} = await pool.query(`
      select * from users where id=$1 limit 1;
    `, [id])
    return toCamelCase(rows);
  }

  static async insert(username, bio) {
    const {rows} = await pool.query(`
      insert into users (username,bio) values ($1,$2) returning *;
    `, [username,bio]);

    return toCamelCase(rows);
  }

  static async update(id, username, bio) {
    const {rows} = await pool.query(`
      update users set username=$1, bio=$2 where id=$3 returning *;
    `, [username,bio,id]);
    
    return toCamelCase(rows);
  }

  static async delete(id) {
    const {rows} = await pool.query(`
      delete from users where id=$1 returning *;
    `, [id]);
  
    return toCamelCase(rows);
  }
}

module.exports = UserRepo;

