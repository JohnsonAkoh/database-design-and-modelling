# Relational Schema – Student Management System

## 1. Introduction

The relational schema represents the logical database structure of the Student Management System. It defines the database tables, attributes, primary keys, foreign keys, and integrity constraints derived from the Entity Relationship Diagram (ERD).

The schema consists of eight related tables designed to support student academic record management.

## 2. Relational Schema Notation

The following notation is used:

- **PK:** Primary Key
- **FK:** Foreign Key
- **UNIQUE:** Prevents duplicate values.
- **NOT NULL:** Requires a value to be provided.

## 3. Relational Schema Definitions

### 3.1 DEPARTMENTS

**DEPARTMENTS** (department_id, department_name)

- department_id – Primary Key
- department_name – Department name

### 3.2 STUDENTS

**STUDENTS** (student_id, student_name, email, department_id)

- student_id – Primary Key
- student_name – Student's full name
- email – Student's email address
- department_id – Foreign Key referencing DEPARTMENTS(department_id)

### 3.3 LECTURERS

**LECTURERS** (lecturer_id, lecturer_name, email, department_id)

- lecturer_id – Primary Key
- lecturer_name – Lecturer's full name
- email – Lecturer's email address
- department_id – Foreign Key referencing DEPARTMENTS(department_id)

### 3.4 COURSES

**COURSES** (course_code, course_title, credit_units, department_id)

- course_code – Primary Key
- course_title – Course title
- credit_units – Number of course credit units
- department_id – Foreign Key referencing DEPARTMENTS(department_id)

### 3.5 SEMESTERS

**SEMESTERS** (semester_id, semester_name, academic_session)

- semester_id – Primary Key
- semester_name – Semester name
- academic_session – Academic session

### 3.6 COURSE_OFFERINGS

**COURSE_OFFERINGS** (offering_id, course_code, semester_id, lecturer_id)

- offering_id – Primary Key
- course_code – Foreign Key referencing COURSES(course_code)
- semester_id – Foreign Key referencing SEMESTERS(semester_id)
- lecturer_id – Foreign Key referencing LECTURERS(lecturer_id)

### 3.7 ENROLLMENTS

**ENROLLMENTS** (enrollment_id, student_id, offering_id, enrollment_date)

- enrollment_id – Primary Key
- student_id – Foreign Key referencing STUDENTS(student_id)
- offering_id – Foreign Key referencing COURSE_OFFERINGS(offering_id)
- enrollment_date – Date of student enrolment

### 3.8 RESULTS

**RESULTS** (result_id, enrollment_id, score, grade)

- result_id – Primary Key
- enrollment_id – Foreign Key referencing ENROLLMENTS(enrollment_id)
- score – Student's numerical assessment score
- grade – Final academic grade

## 4. Primary Key Summary

| Table | Primary Key |
|---|---|
| DEPARTMENTS | department_id |
| STUDENTS | student_id |
| LECTURERS | lecturer_id |
| COURSES | course_code |
| SEMESTERS | semester_id |
| COURSE_OFFERINGS | offering_id |
| ENROLLMENTS | enrollment_id |
| RESULTS | result_id |

## 5. Foreign Key Summary

| Table | Foreign Key | Referenced Table |
|---|---|---|
| STUDENTS | department_id | DEPARTMENTS |
| LECTURERS | department_id | DEPARTMENTS |
| COURSES | department_id | DEPARTMENTS |
| COURSE_OFFERINGS | course_code | COURSES |
| COURSE_OFFERINGS | semester_id | SEMESTERS |
| COURSE_OFFERINGS | lecturer_id | LECTURERS |
| ENROLLMENTS | student_id | STUDENTS |
| ENROLLMENTS | offering_id | COURSE_OFFERINGS |
| RESULTS | enrollment_id | ENROLLMENTS |

## 6. Integrity Constraints

The following constraints are recommended to maintain database accuracy and consistency:

1. Each table must have a primary key to uniquely identify its records.
2. Foreign keys must reference existing records in their parent tables.
3. Student and lecturer email addresses should be unique.
4. Course codes must be unique.
5. Credit units must be positive values.
6. A student must not enrol more than once in the same course offering. This is enforced using a composite UNIQUE constraint on student_id and offering_id.
7. Each enrolment can have at most one result. This is enforced using a UNIQUE constraint on RESULTS.enrollment_id.
8. Scores must fall within the permitted assessment range, for example, 0–100.
9. Required attributes must be protected using NOT NULL constraints.

## 7. Relationship Summary

The relational schema implements the following relationships:

- One department can have many students.
- One department can have many lecturers.
- One department can manage many courses.
- One course can have multiple course offerings.
- One semester can contain multiple course offerings.
- One lecturer can teach multiple course offerings.
- One student can have multiple enrolments.
- One course offering can receive multiple enrolments.
- One enrolment can have zero or one result.

## 8. Conclusion

The relational schema provides the logical structure required to implement the Student Management System in PostgreSQL.

By defining the eight tables, their primary keys, foreign keys, and integrity constraints, the schema establishes a consistent foundation for database implementation, normalisation, and academic information management.
