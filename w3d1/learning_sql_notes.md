# Learning SQL Notes

### Ch 3
* 3.1
  * What is a database connection and how long is it held?

  To execute a query, you must be connected to a database w/ a password and username. If the password and username are correct, the connection is made, and it's maintained until either the application or the server closes it.

  * What is the *query optimizer*?

  To execute a query, you need...
    1. permissiom to execute
    2. permission to access
    3. correct syntax

  The 'query optimizer' is a script(?) that determines the most efficient way to execute your query.







* 3.2
  * Be able to describe the purpose of the `SELECT`, `FROM`, `WHERE`,
    `GROUP BY`, `HAVING` and `ORDER BY` clauses. Don't worry about
    memorizing the definitions in this section now, but you should have
    internalized them by the time you've finished this chapter.











* 3.3
  * How do you add column aliases to a `SELECT` clause?
  * How do you remove duplicates from a `SELECT` clause?
    * Why does this make the query slower?








* 3.4
  * What is a *subquery*?
  * What does a *subquery* generate (or return)?
  * What is a *view*?
  * How do you create an alias for a table?









* 3.5
  * Know how to write simple `WHERE` clauses with multiple filter
    conditions. Know how to group conditions with parentheses.









* 3.7
  * How do you order on multiple columns (i.e., first on one column,
    then on another)?
  * What is the default sorting order, and how do you flip it?
  * How do you sort via an expression?










### Ch 4
* 4.1
  * Be familiar with the `NOT` operator.








* 4.3
  * Be familiar with the following types of conditions:
    equality/inequality, range (incl. the `BETWEEN` operator),
    membership (the `IN` operator, via subqueries, `NOT IN`)
  * Skip Section 4.3.4.1 (Wildcards).
  * Know how to use regex in a search expression.








* 4.4
  * How do you test if an expression is `NULL`?
  * How do you test if a value has been assigned to a column?









### Ch 5
* 5.1
  * What is a cross join and how is it generated?
  * What is an inner join and how is it generated?
  * What is the default type of join?
  * Skip 5.1.3 (ANSI Join Syntax)









* 5.2
  * Know how to inner join 3 (or more) tables. Know how to inner join
    to the same table multiple times.









* 5.3
  * What is a self-referencing foreign key?
  * How do you inner join a table to itself?









* 5.4
  * How do you inner join a table to another on a range of values
    instead of on an equality condition? How do you do that for a
    self-join?









* 5.5
  * As you know, join conditions belong in the `ON` clause and filter
    conditions belong in the `WHERE` clause. What happens if you put a
    join condition in the `WHERE` clause and/or a filter condition in
    an `ON` clause?









