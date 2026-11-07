# MIVA MIT academic portfolio 1
## Database Design and Modelling

**Programme:** Master of Information Technology (MIT)  
**Institution:** MIVA Open University 

**Specialisation:** Information Technology Management  
**Assessment:** Academic Portfolio 1 – Database Design and Modelling 

Database Management System: PostgreSQL

Database Administration Tool: pgAdmin

**Author:** Johnson Abraham Akoh  
**Project Status:** In Progress


## 1. Project Overview

This project demonstrates the application of database design and modelling principles 
through the analysis, design, and development of a relational database system based on
a selected case study.

The project focuses on translating real-world information management requirements into
a structured database model that supports data integrity, consistency, efficiency, and 
effective data retrieval.

It covers the database development process, from requirements analysis and conceptual 
modelling to logical database design, relational schema development, and normalisation.

## 2. Problem Statement

Organisations require reliable database systems to manage, organise, retrieve,
and maintain information efficiently.

Poorly designed databases can result in data redundancy, inconsistent records, 
update anomalies, and difficulties in retrieving accurate information.

This project addresses these challenges by developing a structured relational 
database model based on the selected case study.

## 3. Project Objectives

The major objectives are to:

- Analyse the information management requirements of the selected case study.
- Identify relevant entities, attributes, and relationships.
- Develop an Entity Relationship Diagram (ERD).
- Transform the conceptual model into a relational database schema.
- Identify and define primary keys and foreign keys.
- Apply appropriate database constraints to maintain data integrity.
- Demonstrate database normalisation to reduce redundancy.
- Develop SQL scripts to implement the proposed database structure.

## 4. Case Study Description

**Selected Case Study:**University Student Management System

The Student Management System is a relational database solution
designed to manage academic and administrative information within
a higher education institution.

The system provides a structured approach to managing student
records, academic departments, lecturers, courses, semesters,
course offerings, student enrolments, and academic results.

The proposed database addresses common information management
challenges, including data duplication, inconsistent student
records, inefficient information retrieval, and difficulties
in maintaining accurate academic records.

The database is designed around eight principal entities:

1. Departments
2. Students
3. Lecturers
4. Courses
5. Semesters
6. Course Offerings
7. Enrollments
8. Results

The design uses relational database principles, primary keys,
foreign keys, and integrity constraints to establish relationships
between the entities and maintain data consistency.

PostgreSQL is selected as the database management system, while
pgAdmin is used for database administration and implementation.

The case study provides the foundation for the conceptual,
logical, and physical database design presented in this portfolio.

## 5. Database Design and Modelling Methodology

The project follows a structured database development approach consisting of the following stages:

1. **Requirements Analysis:** Identify the information requirements and business rules.
2. **Conceptual Database Design:** Identify entities, attributes, and relationships.
3. **Entity Relationship Modelling:** Develop the Entity Relationship Diagram.
4. **Logical Database Design:** Convert the ER model into relational tables.
5. **Keys and Constraints:** Define primary keys, foreign keys, and integrity constraints.
6. **Normalisation:** Apply appropriate normal forms to minimise redundancy.
7. **Physical Database Implementation:** Translate the relational design into SQL statements.

## 6. Project Deliverables

The following deliverables constitute the assessment portfolio:

| Deliverable | Description |
|---|---|
| Case Study | Description of the selected case study and requirements |
| ER Diagram | Visual representation of entities and relationships |
| Relational Schema | Database tables, attributes, and relationships |
| Keys and Constraints | Primary keys, foreign keys, and integrity rules |
| Normalisation | Explanation of database normalisation |
| SQL Scripts | SQL statements for database implementation |
| Project Report | Consolidated academic documentation |

## 7. Entity Relationship Diagram (ERD)

This section presents the conceptual database model, illustrating the identified 
entities, their attributes, and the relationships between them.

**ER Diagram:**

<img width="1326" height="2690" alt="mermaid-diagram (1)" src="https://github.com/user-attachments/assets/02795505-995f-49b8-a320-df3eedbbdd8f" />


## 8. Relational Database Schema

The relational schema presents the logical structure of the database, including:

- Table names and attributes.
- Primary key definitions.
- Foreign key relationships.
- Data types.
- Integrity constraints.

The schema demonstrates how the conceptual database model is translated into relational structures.

## 9. Database Normalisation

Normalisation is applied to improve database organisation, minimise unnecessary 
data duplication, and prevent insertion, update, and deletion anomalies.

The project examines the following normalisation stages:

- First Normal Form (1NF).
- Second Normal Form (2NF).
- Third Normal Form (3NF).

Each stage is supported by an explanation of the transformation and the resulting database structure.

## 10. SQL Implementation

SQL scripts are used to implement and demonstrate the proposed relational database design.

The implementation includes:

- Database and table creation.
- Attribute and data type definitions.
- Primary and foreign key constraints.
- Sample data insertion.
- SQL queries for retrieving and managing records.

**Database Technology:** PostgreSQL  
**Database Management Tool:** pgAdmin

## 11. Repository Structure

```text
database-design-and-modelling/
│
├── README.md
│
├── 01-case-study/
│   └── case-study.md
│
├── 02-er-diagram/
│   └── er-diagram.png
│
├── 03-relational-schema/
│   └── relational-schema.md
│
├── 04-sql-scripts/
│   ├── create-tables.sql
│   └── insert-data.sql
│
├── 05-normalisation/
│   └── normalisation.md
│
└── 06-documentation/
    └── project-report.pdf
```

## 12. Expected Learning Outcomes

Upon completion, this project is expected to demonstrate the ability to:

- Analyse database requirements from real-world scenarios.
- Design conceptual and logical database models.
- Construct Entity Relationship Diagrams.
- Develop relational database schemas.
- Apply database keys and integrity constraints.
- Explain and implement database normalisation.
- Use SQL and PostgreSQL to implement database structures.

## 13. Academic Integrity

This portfolio represents academic work undertaken as part of the 
Master of Information Technology programme at MIVA Open University.

All database models, diagrams, SQL scripts, explanations, and supporting
documentation are intended to demonstrate the author's understanding and 
practical application of database design and modelling principles.

---

## Author

**Johnson Abraham Akoh**  
Master of Information Technology (MIT)  
MIVA Open University

**GitHub Repository:** `database-design-and-modelling`

---

*Academic Portfolio 1 – Database Design and Modelling*
