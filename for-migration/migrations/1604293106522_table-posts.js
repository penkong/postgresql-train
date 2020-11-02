/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.sql(`
    create table posts(
      id serial primary key,
      url varchar(300),
      lat numeric,
      lng numeric
    );
  `)
};

exports.down = pgm => {
  pgm.sql(`
    drop table posts;
  `)
};
