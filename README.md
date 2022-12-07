# Module_1_Homework
# Data Modeling Homework: Employee Database ERD

For your first assignment, you’ll first design tables to hold data from CSV files, and you’ll then import the CSV files into a PostgreSQL database.

## Background

It’s a beautiful spring day, and it’s been two weeks since you were hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remains of the database of employees from that period are six CSV files.

So for this assignment, you’ll first design tables to hold data from the CSV files, and you’ll then import the CSV files into a PostgreSQL database

## Before You Begin

1. Create a new repository, named `Employee_DB`, for this homework assignment.

    **Important:** Don’t add this assignment to an existing repository.

2. Clone the `Employee_DB` repository to your computer.

## Instructions

1. Inspect the CSV files, and then sketch an ERD of the tables that you want. To do so, feel free to use a tool like [QuickDBD](http://www.quickdatabasediagrams.com).

2. Use the information from the ERD to create a table schema for each of the six CSV files. Remember to specify the data types, primary keys, foreign keys, and other constraints. For each primary key, remember to do the following:

    * Verify that the column is unique. If it isn’t, create a [composite key](https://en.wikipedia.org/wiki/Compound_key), which takes two primary keys to uniquely identify a row.

      **Hint:** You need to create a composite key for the `titles` table to avoid the "duplicate key value violates unique constraint" import error when importing the `dept_emp.csv` file.

3. Save an image of the ERD to your GitHub repository.

4. Save the database schema as a Postgres `.sql` file to your GitHub repository.

5. Create a new Postgres database, named `Employee_DB`.

6. Using the database schema, create the tables in the correct order to handle the foreign keys.

7. Verify that the tables have been created by using a `SELECT` statement for each table.

8. Import each CSV file into its corresponding SQL table.

    **Hint:** To avoid errors, be sure to import the data in the same order that you created the tables. And, remember to account for the headers when importing.

9. Save the six CSV files to your GitHub repository.

10. Verify that each table contains the correct data by using a `SELECT` statement for each table.

## Grading Requirements

This assignment will be evaluated against the rubric and assigned a grade according to the following table:

| Grade | Points |
| --- | --- |
| High Pass | 90 or more |
| Pass | 70&ndash;89 |
| Fail | 1&ndash;69 |
| Incomplete | 0 |

## Submission

Before you submit your assignment, check your work against the rubric to make sure that you’re meeting the requirements.

To submit your assignment for grading in Canvas, click Start Assignment, click the Website URL tab, add the URL of your `Employee_DB` GitHub repository, and then click Submit. If you’d like to resubmit your work, communicate with your instructional team to request another opportunity to improve your grade.

- - -

## Reference

Mockaroo, LLC. (2021). Realistic Data Generator. [https://www.mockaroo.com/](https://www.mockaroo.com/)

- - -

© 2022 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

