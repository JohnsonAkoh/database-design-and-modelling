
-- =========================================================
-- PROJECT: STUDENT MANAGEMENT SYSTEM
-- FILE: create-tables.sql
-- DBMS: PostgreSQL
-- PURPOSE: Create all eight database tables
-- =========================================================

-- 1. DEPARTMENTS
CREATE TABLE departments (
    department_id INT GENERATED ALWAYS AS IDENTITY,
    department_name VARCHAR(100) NOT NULL,

    CONSTRAINT pk_departments
        PRIMARY KEY (department_id),

    CONSTRAINT uq_department_name
        UNIQUE (department_name)
);

-- 2. STUDENTS
CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    student_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT pk_students
        PRIMARY KEY (student_id),

    CONSTRAINT uq_student_email
        UNIQUE (email),

    CONSTRAINT fk_students_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- 3. LECTURERS
CREATE TABLE lecturers (
    lecturer_id INT GENERATED ALWAYS AS IDENTITY,
    lecturer_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT pk_lecturers
        PRIMARY KEY (lecturer_id),

    CONSTRAINT uq_lecturer_email
        UNIQUE (email),

    CONSTRAINT fk_lecturers_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- 4. COURSES
CREATE TABLE courses (
    course_code VARCHAR(20) NOT NULL,
    course_title VARCHAR(150) NOT NULL,
    credit_units INT NOT NULL,
    department_id INT NOT NULL,

    CONSTRAINT pk_courses
        PRIMARY KEY (course_code),

    CONSTRAINT chk_course_credit_units
        CHECK (credit_units > 0),

    CONSTRAINT fk_courses_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- 5. SEMESTERS
CREATE TABLE semesters (
    semester_id INT GENERATED ALWAYS AS IDENTITY,
    semester_name VARCHAR(50) NOT NULL,
    academic_session VARCHAR(20) NOT NULL,

    CONSTRAINT pk_semesters
        PRIMARY KEY (semester_id),

    CONSTRAINT uq_semester_session
        UNIQUE (semester_name, academic_session)
);

-- 6. COURSE OFFERINGS
CREATE TABLE course_offerings (
    offering_id INT GENERATED ALWAYS AS IDENTITY,
    course_code VARCHAR(20) NOT NULL,
    semester_id INT NOT NULL,
    lecturer_id INT NOT NULL,

    CONSTRAINT pk_course_offerings
        PRIMARY KEY (offering_id),

    CONSTRAINT fk_offerings_course
        FOREIGN KEY (course_code)
        REFERENCES courses(course_code),

    CONSTRAINT fk_offerings_semester
        FOREIGN KEY (semester_id)
        REFERENCES semesters(semester_id),

    CONSTRAINT fk_offerings_lecturer
        FOREIGN KEY (lecturer_id)
        REFERENCES lecturers(lecturer_id),

    CONSTRAINT uq_course_semester
        UNIQUE (course_code, semester_id)
);

-- 7. ENROLLMENTS
CREATE TABLE enrollments (
    enrollment_id INT GENERATED ALWAYS AS IDENTITY,
    student_id INT NOT NULL,
    offering_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT pk_enrollments
        PRIMARY KEY (enrollment_id),

    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollments_offering
        FOREIGN KEY (offering_id)
        REFERENCES course_offerings(offering_id),

    CONSTRAINT uq_student_offering
        UNIQUE (student_id, offering_id)
);

-- 8. RESULTS
CREATE TABLE results (
    result_id INT GENERATED ALWAYS AS IDENTITY,
    enrollment_id INT NOT NULL,
    score NUMERIC(5,2) NOT NULL,
    grade VARCHAR(5) NOT NULL,

    CONSTRAINT pk_results
        PRIMARY KEY (result_id),

    CONSTRAINT uq_result_enrollment
        UNIQUE (enrollment_id),

    CONSTRAINT chk_result_score
        CHECK (score >= 0 AND score <= 100),

    CONSTRAINT fk_results_enrollment
        FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id)
);

-- =========================================================
-- END OF TABLE CREATION SCRIPT
-- =========================================================
