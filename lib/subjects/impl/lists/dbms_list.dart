import '../../api/mcq_problem_class.dart';

List<MCQProblem> dbmsList = [
  MCQProblem(
    statement:
        'Which DBMS component is responsible for managing the physical storage of data on disk?',
    options: [
      'Query Processor',
      'Data Dictionary',
      'Buffer Manager',
      'Storage Manager'
    ],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement: 'What is the primary key used for in a relational database?',
    options: [
      'To uniquely identify each record in a table',
      'To link tables together in a database',
      'To perform complex queries on the database',
      'To store the metadata about the database'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which type of join returns only the common rows between two tables?',
    options: ['Inner Join', 'Left Join', 'Right Join', 'Full Outer Join'],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'In a relational database, what is the purpose of a foreign key?',
    options: [
      'To enforce referential integrity between tables',
      'To store large binary data such as images',
      'To index the primary key for faster retrieval',
      'To represent the primary key of another table'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which type of database system is designed for handling large volumes of data and high transaction rates?',
    options: [
      'Relational Database',
      'NoSQL Database',
      'Hierarchical Database',
      'Object-Oriented Database'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the COMMIT statement in a database transaction?',
    options: [
      'To start a new transaction',
      'To undo the changes made in a transaction',
      'To save the changes made in a transaction permanently',
      'To rollback the changes made in a transaction'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which normal form requires that there are no partial dependencies in a relational database?',
    options: [
      'First Normal Form (1NF)',
      'Second Normal Form (2NF)',
      'Third Normal Form (3NF)',
      'Boyce-Codd Normal Form (BCNF)'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'What is the purpose of the GROUP BY clause in an SQL query?',
    options: [
      'To filter rows in the result set',
      'To sort the result set in ascending order',
      'To aggregate data and perform calculations',
      'To join multiple tables together'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which type of index allows for faster searching of data in a database?',
    options: [
      'Primary Index',
      'Clustered Index',
      'Non-Clustered Index',
      'Composite Index'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement: 'What is the purpose of the TRUNCATE statement in SQL?',
    options: [
      'To delete specific rows from a table',
      'To remove all data from a table',
      'To drop a table from the database',
      'To update existing data in a table'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'Which type of relationship in a relational database represents a one-to-many relationship between two tables?',
    options: ['One-to-One', 'One-to-Many', 'Many-to-Many', 'Many-to-One'],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement:
        'In a SQL query, which keyword is used to retrieve data from multiple tables?',
    options: ['SELECT', 'FROM', 'JOIN', 'WHERE'],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which type of data model uses a collection of objects to represent data and their relationships?',
    options: [
      'Hierarchical Data Model',
      'Network Data Model',
      'Entity-Relationship Model',
      'Object-Oriented Data Model'
    ],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement:
        'What is the purpose of the CASCADE DELETE constraint in a database?',
    options: [
      'To automatically delete records from related tables',
      'To enforce referential integrity between tables',
      'To prevent deletion of records from a table',
      'To update records in related tables'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which type of join returns all rows from one table and the matching rows from the other table?',
    options: ['Inner Join', 'Left Join', 'Right Join', 'Full Outer Join'],
    correctOptionIndex: 3,
  ),
  MCQProblem(
    statement: 'What is the purpose of the HAVING clause in an SQL query?',
    options: [
      'To filter rows in the result set',
      'To sort the result set in ascending order',
      'To aggregate data and perform calculations',
      'To join multiple tables together'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'Which type of index is physically reordering the records of the table in the storage to match the index?',
    options: [
      'Primary Index',
      'Clustered Index',
      'Non-Clustered Index',
      'Composite Index'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'What is the purpose of the DELETE statement in SQL?',
    options: [
      'To delete specific rows from a table',
      'To remove all data from a table',
      'To drop a table from the database',
      'To update existing data in a table'
    ],
    correctOptionIndex: 0,
  ),
  MCQProblem(
    statement:
        'Which type of database model is based on a tree-like structure with parent-child relationships?',
    options: [
      'Relational Database Model',
      'Network Database Model',
      'Hierarchical Database Model',
      'Object-Oriented Database Model'
    ],
    correctOptionIndex: 2,
  ),
  MCQProblem(
    statement:
        'In a database transaction, what is the purpose of the SAVEPOINT statement?',
    options: [
      'To start a new transaction',
      'To set a point to which the transaction can be rolled back',
      'To commit the transaction and save the changes',
      'To undo all the changes made in the transaction'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'What is the purpose of the ORDER BY clause in an SQL query?',
    options: [
      'To filter rows in the result set',
      'To sort the result set in ascending order',
      'To aggregate data and perform calculations',
      'To join multiple tables together'
    ],
    correctOptionIndex: 1,
  ),
  MCQProblem(
    statement: 'Which type of index is created on multiple columns in a table?',
    options: [
      'Primary Index',
      'Clustered Index',
      'Non-Clustered Index',
      'Composite Index'
    ],
    correctOptionIndex: 3,
  ),
  // Add more MCQ problems here
];
