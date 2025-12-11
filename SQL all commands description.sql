-- Data Definition Language (DDL)
-- DDL commands manage the structure and schema of the database, such as creating or modifying tables and other objects. 

-- CREATE: Creates a new database, table, index, or view.
-- Example: CREATE TABLE Employees (EmployeeID INT, Name VARCHAR(255));

-- ALTER: 		Modifies the structure of an existing database object, for example, adding or deleting columns in a table.

-- DROP: 		Deletes a table, database, or other object and all the data within it.

-- TRUNCATE: 	Removes all records from a table quickly, but the table structure remains. 

--------------------------------------------------------------------------------------------------------------------------------------
-- Data Manipulation Language (DML)
-- DML commands are used for managing and manipulating data within the structured tables. 

-- INSERT: 		Adds new rows of data into a table.
-- Example: INSERT INTO Customers (CustomerID, Name) VALUES (1, 'John Doe');

-- UPDATE: 		Modifies existing records in a table.

-- DELETE: 		Removes existing rows from a table. 

--------------------------------------------------------------------------------------------------------------------------------------
-- Data Query Language (DQL)
-- These commands are used for retrieving data from the database. 

-- SELECT: 		Extracts data from a database.
-- Example: 	SELECT * FROM Customers;

---------------------------------------------------------------------------------------------------------------------------------------
-- Transaction Control Language (TCL) 
-- TCL commands manage the transactions made by DML statements, ensuring data integrity. 

-- COMMIT:		Permanently saves the changes made during the current transaction.

-- ROLLBACK: 	Undoes all changes since the last COMMIT or ROLLBACK, reverting the database to its previous state.

-- SAVEPOINT:	 Sets a point within a transaction to which you can later revert. 

----------------------------------------------------------------------------------------------------------------------------------------
-- Data Control Language (DCL)
-- DCL commands are used to manage user access, permissions, and controls of the database. 

-- GRANT:		 Gives a user access privileges to the database.
-- REVOKE: 		 Removes user access privileges previously granted with the GRANT command. 

---------------------------------------------------------------------------------------------------------------------------------------
 -- SQL Constraints.
--  
-- NOT NULL:	 Ensures that a column cannot store a NULL value, guaranteeing that essential data is always present for every record.
--  
-- UNIQUE:		 Ensures that all values in a column (or a group of columns) are distinct. While a table can have multiple UNIQUE constraints, it only allows one PRIMARY KEY.

-- PRIMARY KEY: 	Uniquely identifies each record in a table. It is a combination of NOT NULL and UNIQUE constraints and every table should ideally have one to maintain data integrity.

-- FOREIGN KEY:		 Establishes a link and enforces referential integrity between data in two tables. The foreign key column(s) in the child table must match the primary key column(s) in the parent table.

-- CHECK: 		Limits the range or format of values that can be entered into a column by evaluating a logical condition. Data is only inserted if the condition is met.

-- DEFAULT: 	Automatically assigns a default value to a column if no value is explicitly provided during an INSERT operation.

-- INDEX: 		Used to create indexes on a table to retrieve data from the database faster. The index improves performance and is hidden from the users. 