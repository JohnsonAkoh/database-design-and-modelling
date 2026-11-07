# STUDENT MANAGEMENT SYSTEM
## Database Design and Modelling – Academic Project Report

**Programme:** Master of Information Technology  
**Institution:** MIVA Open University  
**Specialisation:** Information Technology Management  
**Course Assessment:** Academic Portfolio 1 – Database Design and Modelling  
**Database Management System:** PostgreSQL  
**Administration Tool:** pgAdmin 4  
**Student:** Johnson Abraham Akoh  
**Project Status:** Implementation and testing completed; final integrity verification pending.

---

## Abstract

This project presents the design, modelling, and implementation of a relational database for a Student Management System. The project addresses common academic information management challenges, including data duplication, inconsistent records, inefficient retrieval, and difficulties maintaining reliable student academic information.

The database was designed using Entity Relationship Diagram (ERD) modelling, relational schema development, and normalisation principles. It consists of eight related tables: Departments, Students, Lecturers, Courses, Semesters, Course Offerings, Enrollments, and Results.

PostgreSQL was used to implement the database, while pgAdmin 4 provided the graphical administration environment. The implementation includes primary keys, foreign keys, unique constraints, and check constraints.

The database was populated with 30 sample records across the eight tables. Testing confirmed that the database tables were created, the sample records were inserted, and a multi-table JOIN query successfully retrieved six academic records.

The project demonstrates the application of relational database design principles to an academic information management scenario.

## 1. Introduction

Educational institutions manage large volumes of academic information, including student details, departmental records, lecturer information, course registrations, semesters, and examination results.

A well-designed relational database provides an organised approach to storing and retrieving these records while maintaining consistency and integrity.

This project develops a Student Management System database using relational database design and modelling principles. It demonstrates the stages involved in identifying database entities, defining relationships, developing a relational schema, applying normalisation, implementing tables, and testing database operations.

## 2. Problem Statement

Managing academic records through disconnected spreadsheets or poorly structured information systems can result in:

- Duplicate student and academic records.
- Inconsistent departmental information.
- Difficulties tracking student enrolments.
- Inefficient retrieval of academic results.
- Weak enforcement of data integrity.
- Increased administrative effort.

The project addresses these challenges through a structured relational database design.

## 3. Aim and Objectives

### 3.1 Aim

To design, model, and implement a relational database for a Student Management System that supports consistent academic record management and efficient information retrieval.

### 3.2 Objectives

1. Identify the major entities and attributes required by the system.
2. Develop an Entity Relationship Diagram.
3. Design a relational schema with appropriate primary and foreign keys.
4. Apply 1NF, 2NF, and 3NF normalisation principles.
5. Implement the database using PostgreSQL.
6. Enforce database integrity through appropriate constraints.
7. Insert sample academic records.
8. Test database relationships and information retrieval using SQL queries.

## 4. Project Scope

The database covers eight principal academic entities:

1. Departments
2. Students
3. Lecturers
4. Courses
5. Semesters
6. Course Offerings
7. Enrollments
8. Results

The project focuses on database design, modelling, normalisation, implementation, and testing. It does not implement a complete web-based student portal, payment platform, or learning management system.

## 5. Methodology

The project followed a structured relational database development process.

### 5.1 Requirements Identification

The academic information requirements were identified, including student registration, departmental organisation, course management, lecturer assignments, semester scheduling, enrolment, and results.

### 5.2 Conceptual Database Design

An Entity Relationship Diagram was developed to represent the eight entities, their attributes, primary keys, foreign keys, and relationships.

### 5.3 Logical Database Design

The ERD was translated into a relational schema defining the eight tables and their relationships.

### 5.4 Database Normalisation

The design applied First Normal Form, Second Normal Form, and Third Normal Form to minimise unnecessary redundancy and reduce data anomalies.

### 5.5 Physical Database Implementation

PostgreSQL was used to create the database tables and enforce database constraints.

### 5.6 Testing and Verification

SQL queries were used to verify table creation, sample data insertion, relationships, and registered database constraints.

## 6. Entity Relationship Design

The database consists of eight entities.

| Entity | Primary Key | Purpose |
|---|---|---|
| DEPARTMENTS | department_id | Stores academic departments |
| STUDENTS | student_id | Stores student records |
| LECTURERS | lecturer_id | Stores lecturer records |
| COURSES | course_code | Stores course information |
| SEMESTERS | semester_id | Stores academic semesters |
| COURSE_OFFERINGS | offering_id | Connects courses, semesters, and lecturers |
| ENROLLMENTS | enrollment_id | Records student enrolments |
| RESULTS | result_id | Stores examination results |

The relationships include:

- One department to many students.
- One department to many lecturers.
- One department to many courses.
- One course to many course offerings.
- One semester to many course offerings.
- One lecturer to many course offerings.
- One student to many enrolments.
- One course offering to many enrolments.
- One enrolment to zero or one result.

The ER diagram is provided in the `02-er-diagram` directory.

## 7. Relational Schema

The logical database structure comprises eight relational tables.

- DEPARTMENTS (department_id, department_name)
- STUDENTS (student_id, student_name, email, department_id)
- LECTURERS (lecturer_id, lecturer_name, email, department_id)
- COURSES (course_code, course_title, credit_units, department_id)
- SEMESTERS (semester_id, semester_name, academic_session)
- COURSE_OFFERINGS (offering_id, course_code, semester_id, lecturer_id)
- ENROLLMENTS (enrollment_id, student_id, offering_id, enrollment_date)
- RESULTS (result_id, enrollment_id, score, grade)

Primary and foreign key relationships establish the connections between the tables.

The complete relational schema is documented in `03-relational-schema/relational-schema.md`.

## 8. Database Normalisation

The database design applies three normalisation levels.

### 8.1 First Normal Form (1NF)

Attributes contain atomic values, and repeating groups are represented through separate records and related tables.

### 8.2 Second Normal Form (2NF)

Each table uses a single-column primary key. Therefore, partial dependencies on part of a composite primary key do not arise.

### 8.3 Third Normal Form (3NF)

Descriptive information is maintained in its appropriate entity table. For example, department names are stored in DEPARTMENTS rather than repeatedly duplicated in STUDENTS, LECTURERS, and COURSES.

The complete normalisation explanation is available in `05-normalisation/normalisation.md`.

## 9. PostgreSQL Implementation

The database was implemented using PostgreSQL 18 and administered through pgAdmin 4.

The database name is:

`database_design_and_modelling`

Two SQL scripts were developed:

- `create-tables.sql`: creates the eight relational tables.
- `insert-data.sql`: inserts sample academic records.

### 9.1 Database Constraints

The implementation includes:

- Eight primary key constraints.
- Nine foreign key constraints.
- Seven unique constraints.
- Two explicit CHECK constraints.
- NOT NULL requirements on mandatory attributes.

The constraints support entity integrity, referential integrity, uniqueness, and valid data ranges.

## 10. Sample Data Implementation

The database was populated with 30 sample records.

| Table | Number of records |
|---|---:|
| Departments | 2 |
| Students | 4 |
| Lecturers | 2 |
| Courses | 4 |
| Semesters | 2 |
| Course Offerings | 4 |
| Enrollments | 6 |
| Results | 6 |
| **Total** | **30** |

The sample records demonstrate the relationships between departments, students, courses, lecturers, semesters, enrolments, and results.

## 11. Testing and Results

The following tests were conducted.

### 11.1 Table Creation Test

A query against PostgreSQL's information schema confirmed that eight base tables were created in the public schema.

**Observed result:** Eight tables.

### 11.2 Sample Data Verification

A SQL verification query returned the expected number of records in each of the eight tables.

**Observed result:** 30 records across eight tables.

### 11.3 Relational JOIN Test

A multi-table SQL JOIN query combined information from the eight tables.

The query retrieved:

- Student identification and names.
- Department names.
- Course codes and titles.
- Semester and academic session.
- Lecturer names.
- Examination scores and grades.

**Observed result:** Six records successfully retrieved.

This demonstrated that the defined relationships could be used to retrieve related academic information.

### 11.4 Constraint Registration Test

A query against `information_schema.table_constraints` confirmed the registration of primary keys, foreign keys, unique constraints, and check constraints.

**Observed result:** The expected named constraints were present.

### 11.5 Referential Integrity Test

A further query was prepared to identify orphaned records in the student, course offering, enrolment, and result relationships.

**Status:** Final query execution and result verification pending at the time of this report.

## 12. Discussion

The implementation demonstrates how relational database design can support academic information management.

The separation of departments, students, lecturers, courses, semesters, course offerings, enrolments, and results into related tables provides a structured approach to data storage.

The primary keys identify individual records, while foreign keys establish relationships between related entities. Unique and check constraints provide additional protection against duplicate and invalid records.

The successful JOIN query demonstrates the practical value of the relational structure for retrieving information across multiple academic entities.

## 13. Limitations and Future Improvements

The current implementation uses a relatively small sample dataset and focuses on the database layer.

Future improvements could include:

1. Development of a web-based student management interface.
2. User authentication and role-based access control.
3. Student course registration interfaces.
4. Academic transcript generation.
5. Automated academic performance reporting.
6. Database backup and recovery procedures.
7. Larger-scale performance testing.
8. Integration with institutional information systems.

## 14. Conclusion

This project successfully demonstrates the design, modelling, and practical implementation of a Student Management System relational database using PostgreSQL.

The project identified eight academic entities, developed an Entity Relationship Diagram, established a relational schema, applied normalisation principles, and implemented database tables with appropriate constraints.

The database was populated with 30 sample records, and SQL testing successfully retrieved six related academic records through a multi-table JOIN query.

The project provides a practical demonstration of relational database design principles and establishes a foundation for developing a more comprehensive academic information management system.

## 15. Project Repository

**GitHub Repository:**  
https://github.com/JohnsonAkoh/database-design-and-modelling

The repository contains the project overview, case study, ER diagram, relational schema, SQL implementation scripts, normalisation documentation, and project report.

---

**End of Report**
