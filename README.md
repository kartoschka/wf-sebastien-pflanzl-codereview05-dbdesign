# end result files

  - `draft.md`: text document on the design of the database with
    entity-property lists and a stepwise description of the process of renting
    a car.
  - `er-diagram.pdf`: a diagram drawn with draw.io showing table/entity names and
    relationship cardinalities.
  - `carrental-db_post-creation-dump.create-table-stmts-only.dbdiagram-io-automatic-diagram.pdf`:
    a diagram automatically created from the database dump using dbdiagram.io to
    show foreign key relationships and try and verify the design sketched out in
    `er-diagram.pdf` and `draft.md`.
  - `queries.sql`: sample queries with comments describing what they do
  - `carrental-2_all-tables-populated.dump.sql`: final dump containing all the
    test data
  - `table-data-report.txt`: simply lists the contents of all tables with their test
    data using `select *`
  - `table-structure-report.txt`: like `...data-report.txt` with `show create
    table ...` instead of `select * ...`

# work-in-progress files

  - `carrental-db_post-creation-dump.sql`: dump of empty tables after creating and
    adjusting the schema.
  - `carrental-db_post-creation-dump.create-table-stmts-only.sql`: like above,
    but with all weird things and meta commands removed by hand to see the
    `create table` statements more clearly (and to be able to import it into
    dbdiagram.io)
  - `carrental-1_before-adding-reservations.dump.sql`: some adjustments to table
    structure after `carrental-db...` files (but nothing relevant to the entity
    diagrams); sample data has been added except `reservation -> checkin -> checkout ->
    issue`
  - `insert-reservations.sql`: sql commands to add sample reservation data
    because doing it command for command was becoming confusing
  - `insert-checkins.sql`: sql commands to add sample checkin data
  - `insert-checkouts.sql`: sql commands to add sample checkout data
  - `insert-issues.sql`: sql commands to add sample issue data
