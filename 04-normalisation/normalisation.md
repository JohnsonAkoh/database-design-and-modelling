# Database Normalisation – Student Management System

## 1. Introduction

Database normalisation is a systematic process of organising data within relational database tables to minimise data redundancy, prevent data anomalies, and improve data integrity.

This project applies the principles of First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) to the Student Management System database.

The objective is to ensure that the database structure supports consistent storage and retrieval of student academic records.

## 2. First Normal Form (1NF)

A relational table satisfies First Normal Form when:

- Each column contains a single, atomic value.
- Each record can be uniquely identified.
- Repeating groups and multi-valued attributes are eliminated.

### Application to the Student Management System

The database stores individual values in each attribute rather than combining multiple values in a single column.

For example, the STUDENTS table contains:

| student_id | student_name | email | department_id |
|---|---|---|---|
| 1001 | John Adams | john@example.com | 1 |
| 1002 | Mary James | mary@example.com | 2 |
| 1003 | Peter Daniel | peter@example.com | 1 |

Each student occupies a separate row, and each attribute contains one value.

Course enrolments are also stored separately in the ENROLLMENTS table rather than storing multiple course offerings in one student record.

**Result:** The database satisfies 1NF because its attributes contain atomic values and repeating groups are represented through related records.

## 3. Second Normal Form (2NF)

A relational table satisfies Second Normal Form when:

- It already satisfies 1NF.
- Every non-key attribute is fully functionally dependent on the entire candidate key.
- There are no partial dependencies on part of a composite candidate key.

### Application to the Student Management System

The tables in this project use single-column primary keys:

- DEPARTMENTS: department_id
- STUDENTS: student_id
- LECTURERS: lecturer_id
- COURSES: course_code
- SEMESTERS: semester_id
- COURSE_OFFERINGS: offering_id
- ENROLLMENTS: enrollment_id
- RESULTS: result_id

Because each table uses a single-column primary key, partial dependency on part of a composite primary key does not arise.

For example, in the ENROLLMENTS table, student_id, offering_id, and enrollment_date are associated with the enrollment record identified by enrollment_id.

A separate UNIQUE constraint on (student_id, offering_id) prevents duplicate enrolments without changing the primary key.

**Result:** The tables satisfy 2NF because they satisfy 1NF and do not contain partial dependencies on composite primary keys.

## 4. Third Normal Form (3NF)

A relational table satisfies Third Normal Form when:

- It already satisfies 2NF.
- Non-key attributes depend on the key, the whole key, and nothing but the key.
- Transitive dependencies of non-key attributes on primary keys are eliminated.

### Application to the Student Management System

The database separates information about departments, students, lecturers, courses, semesters, course offerings, enrolments, and results into individual related tables.

Examples include:

**Department information**

Department names are stored in the DEPARTMENTS table. STUDENTS, LECTURERS, and COURSES reference departments through department_id rather than repeatedly storing department details.

**Course information**

Course titles and credit units are stored in the COURSES table. COURSE_OFFERINGS references the course through course_code instead of duplicating the course details.

**Lecturer information**

Lecturer names and email addresses are stored in the LECTURERS table. COURSE_OFFERINGS references lecturers through lecturer_id.

**Student enrolment information**

Student enrolment records are stored in the ENROLLMENTS table, while examination scores and grades are maintained in the RESULTS table.

These arrangements reduce duplication and ensure that descriptive information is maintained in its appropriate table.

**Result:** The proposed design satisfies 3NF under the stated functional dependencies and business rules because non-key descriptive attributes are maintained in their respective entity tables rather than duplicated across related tables.

## 5. Summary of Normalisation

| Normal Form | Requirement | Application |
|---|---|---|
| 1NF | Atomic values and no repeating groups | Attributes contain individual values and repeated enrolments are stored as separate records. |
| 2NF | No partial dependencies | Tables use single-column primary keys, eliminating partial dependencies on composite primary keys. |
| 3NF | No transitive dependencies | Department, course, lecturer, and other descriptive information are maintained in separate tables. |

## 6. Benefits of Normalisation

The normalisation process provides the following benefits:

1. Reduces unnecessary data duplication.
2. Improves consistency across academic records.
3. Minimises insertion, update, and deletion anomalies.
4. Improves data integrity through clearly defined relationships.
5. Makes database maintenance easier.
6. Supports reliable retrieval of student and academic information.

## 7. Conclusion

The Student Management System database applies the principles of 1NF, 2NF, and 3NF to establish a structured relational database.

The separation of academic entities into eight related tables reduces unnecessary duplication and provides a clear foundation for maintaining student, course, lecturer, enrolment, and result information.

The resulting design supports data consistency, referential integrity, and efficient academic record management using PostgreSQL.
