/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.sql(`
    alter table posts
    add column loc point;
  `)
};

exports.down = pgm => {
  pgm.sql(`
    alter table posts
    drop column loc;
  `)
};
