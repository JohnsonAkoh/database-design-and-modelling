# University Student Management System
## Case Study Description

**Academic Programme:** Master of Information Technology (MIT)  
**Institution:** MIVA Open University  
**Specialisation:** Information Technology Management  
**Portfolio:** Academic Portfolio 1 – Database Design and Modelling  
**Database Management System:** PostgreSQL  
**Administration Tool:** pgAdmin 4  
**Prepared by:** Johnson Abraham Akoh  

---

## 1. Introduction

Educational institutions manage large volumes of academic and administrative information, including student biodata, departmental records, lecturer information, course details, semester schedules, student enrolments, and examination results.

Managing these records manually or through disconnected systems can result in data duplication, inconsistent information, delayed record retrieval, and difficulties maintaining accurate academic records.

This case study proposes a relational database solution known as the **Student Management System (SMS)**. The system is designed to organise and manage essential academic records within a higher education institution using relational database principles.

PostgreSQL is selected as the database management system because it supports relational data structures, integrity constraints, transactions, and SQL-based data manipulation.

## 2. Background of the Case Study

The proposed Student Management System represents a university environment in which students are admitted into academic departments, register for courses, participate in academic semesters, and receive results for completed courses.

The institution requires a structured database capable of maintaining relationships between students, departments, lecturers, courses, semesters, course offerings, enrolments, and academic results.

The database design will provide a foundation for storing, retrieving, updating, and analysing academic information efficiently.

## 3. Problem Statement

Without a properly designed database, an institution may experience the following challenges:

1. **Data duplication:** Student and academic information may be recorded repeatedly across different records.
2. **Data inconsistency:** Changes to student, lecturer, or course information may not be reflected across all records.
3. **Inefficient information retrieval:** Retrieving student enrolment histories and academic results may require considerable time.
4. **Poor data integrity:** Inadequate relationships between records may result in invalid or incomplete information.
5. **Difficult academic reporting:** Generating departmental, course, enrolment, and student performance reports may become complicated.
6. **Limited scalability:** Unstructured data management makes it difficult to accommodate increasing student populations and academic activities.

A relational database is therefore required to address these challenges through proper entity identification, relationships, keys, constraints, and normalisation.

## 4. Aim of the Project

The aim of this project is to design and implement a relational database for a Student Management System that supports the efficient storage, organisation, retrieval, and management of academic information within a higher education institution.

## 5. Project Objectives

The specific objectives are to:

1. Identify the major entities and attributes required for managing student academic information.
2. Develop an Entity-Relationship Diagram (ERD) showing the entities, relationships, and cardinalities.
3. Transform the conceptual database design into a relational schema.
4. Define appropriate primary keys and foreign keys.
5. Apply integrity constraints to maintain data accuracy and consistency.
6. Apply database normalisation principles to minimise data redundancy and update anomalies.
7. Implement the database structure using PostgreSQL.
8. Populate the database with sample academic records.
9. Execute SQL queries to retrieve and analyse relevant academic information.

## 6. Scope of the Project

The database design covers the following functional areas:

- Department management.
- Student records management.
- Lecturer records management.
- Course management.
- Academic semester management.
- Course offering management.
- Student course enrolment.
- Academic results management.

The project focuses on the design and implementation of the relational database. It does not cover a complete web-based student portal, online payment processing, biometric attendance, learning management systems, or automated admission processing.

## 7. Major Database Entities

The proposed database consists of eight principal entities.

### 7.1 Departments

Stores information about the academic departments within the institution.

Examples of attributes include:
- department_id
- department_name

### 7.2 Students

Stores students' personal and academic registration information.

Examples of attributes include:
- student_id
- first_name
- last_name
- email
- gender
- date_of_birth
- department_id

### 7.3 Lecturers

Stores information about academic staff responsible for teaching courses.

Examples of attributes include:
- lecturer_id
- first_name
- last_name
- email
- department_id

### 7.4 Courses

Stores information about courses offered by academic departments.

Examples of attributes include:
- course_id
- course_code
- course_title
- credit_unit
- department_id

### 7.5 Semesters

Stores information about the academic semesters organised by the institution.

Examples of attributes include:
- semester_id
- semester_name
- academic_year
- start_date
- end_date

### 7.6 Course Offerings

Represents courses scheduled for delivery during specific academic semesters and assigned to lecturers.

Examples of attributes include:
- offering_id
- course_id
- lecturer_id
- semester_id

### 7.7 Enrollments

Records students' registration for specific course offerings.

Examples of attributes include:
- enrollment_id
- student_id
- offering_id
- enrollment_date

### 7.8 Results

Stores the academic results associated with student course enrolments.

Examples of attributes include:
- result_id
- enrollment_id
- score
- grade

## 8. Business Rules and Database Relationships

The following business rules guide the database design:

1. Each department can have multiple students, but each student belongs to one department.
2. Each department can have multiple lecturers, but each lecturer belongs to one department.
3. Each department can offer multiple courses, but each course belongs to one department.
4. A course can have multiple course offerings across different semesters.
5. Each course offering is associated with one course, one lecturer, and one semester.
6. A lecturer may teach multiple course offerings.
7. A semester can contain multiple course offerings.
8. A student can enrol in multiple course offerings.
9. A course offering can have multiple student enrolments.
10. Each enrolment is associated with one student and one course offering.
11. Each enrolment can have one corresponding result record in the proposed design.

These rules establish the relationships required for the Entity-Relationship Diagram and relational schema.

## 9. Design Assumptions and Constraints

The following assumptions apply to the proposed database:

- Every student must have a unique student identifier.
- Every department must have a unique department identifier.
- Every lecturer must have a unique lecturer identifier.
- Every course must have a unique course identifier and course code.
- Each course offering must be uniquely identifiable.
- A student cannot register for the same course offering more than once.
- Each enrolment must reference an existing student and course offering.
- Each result must reference an existing enrolment.
- Academic scores must fall within the institution's approved scoring range.
- Foreign key constraints will be used to maintain referential integrity.
- Required fields will be protected using appropriate NOT NULL constraints.
- Unique constraints will be applied to fields that require unique values.

The database implementation will translate these assumptions into appropriate SQL constraints.

## 10. Expected Outcomes

At the completion of the project, the following outcomes are expected:

1. A documented case study describing the Student Management System.
2. An Entity-Relationship Diagram illustrating the database structure.
3. A relational schema showing tables, attributes, primary keys, and foreign keys.
4. A normalisation explanation demonstrating how data redundancy is reduced.
5. PostgreSQL SQL scripts for creating and populating the database.
6. A functional database structure capable of storing and retrieving academic records.
7. Documentation explaining the database design and implementation process.

## 11. Conclusion

The Student Management System provides a practical case study for applying database design and modelling principles to an academic environment.

Through entity identification, relationship modelling, relational schema development, normalisation, and PostgreSQL implementation, the project demonstrates how a properly structured relational database can support accurate and efficient academic information management.

The resulting database design provides a foundation for improving data integrity, reducing unnecessary duplication, and supporting academic information retrieval and reporting.

---

**End of Case Study**
