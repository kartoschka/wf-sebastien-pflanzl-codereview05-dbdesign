FILES
=====

  - `draft.md`: text exploration on the design of the database with
    entity-property lists and a story-like description of the process of renting
    a car.
  - `er-diagram.pdf`: a diagram drawn with draw.io showing table/entity names and
    relationship cardinalities.
  - `carrental-db_post-creation-dump.sql`: dump of empty tables after creating and
    adjusting the schema.
  - `carrental-db_post-creation-dump.create-table-stmts-only.sql`: like above,
    but with all weird things and meta commands removed by hand to see the
    `create table` statements more clearly (and to be able to import it into
    dbdiagram.io)
  - `carrental-db_post-creation-dump.create-table-stmts-only.dbdiagram-io-automatic-diagram.pdf`:
    a diagram automatically created from the database dump using dbdiagram.io to
    show foreign key relationships and try and verify the design sketched out in
    `er-diagram.pdf` and `draft.md`.
  - `carrental-1_before-adding-reservations.dump.sql`: some adjustments to table
    structure after `carrental-db...` files (but nothing relevant to the entity
    diagrams); sample data has been added except `reservation -> checkin -> checkout ->
    issue`
  - `queries.sql`: sample queries with comments describing what they do
