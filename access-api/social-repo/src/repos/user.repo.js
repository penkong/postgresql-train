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
    const {rows} = await pool.query(`
      select * from users where id=${id} limit 1;
    `)
    return toCamelCase(rows);
  }

  static async insert() {}

  static async update() {}

  static async delete() {}
}

module.exports = UserRepo;

