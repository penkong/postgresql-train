/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.sql(`
    alter table comments
    rename column contents to body;
  `)
};

exports.down = pgm => {
  pgm.sql(`
    alter table comments
    rename column body to contents;
  `)
};
