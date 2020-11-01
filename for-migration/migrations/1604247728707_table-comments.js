/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.sql(`
    create table comments(
      id serial primary key,
      created_at timestamp with time zone default current_timestamp,
      updated_at timestamp with time zone default current_timestamp,
      contents varchar(240) not null
    );
  `)
};

exports.down = pgm => {
  pgm.sql(`
    drop table comments;
  `)
};
