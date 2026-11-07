
-- =========================================================
-- PROJECT: STUDENT MANAGEMENT SYSTEM
-- FILE: insert-data.sql
-- DBMS: PostgreSQL
-- PURPOSE: Insert sample records into all eight tables
-- =========================================================

BEGIN;

-- 1. DEPARTMENTS
INSERT INTO departments (department_name)
VALUES
    ('Computer Science'),
    ('Business Administration');

-- 2. STUDENTS
INSERT INTO students (student_name, email, department_id)
SELECT v.student_name, v.email, d.department_id
FROM (
    VALUES
        ('John Adams', 'john.adams@example.com', 'Computer Science'),
        ('Mary James', 'mary.james@example.com', 'Computer Science'),
        ('Peter Daniel', 'peter.daniel@example.com', 'Business Administration'),
        ('Grace Michael', 'grace.michael@example.com', 'Business Administration')
) AS v(student_name, email, department_name)
JOIN departments d
    ON d.department_name = v.department_name;

-- 3. LECTURERS
INSERT INTO lecturers (lecturer_name, email, department_id)
SELECT v.lecturer_name, v.email, d.department_id
FROM (
    VALUES
        ('Dr. Samuel Johnson', 'samuel.johnson@example.com', 'Computer Science'),
        ('Dr. Elizabeth Brown', 'elizabeth.brown@example.com', 'Business Administration')
) AS v(lecturer_name, email, department_name)
JOIN departments d
    ON d.department_name = v.department_name;

-- 4. COURSES
INSERT INTO courses (course_code, course_title, credit_units, department_id)
SELECT v.course_code, v.course_title, v.credit_units, d.department_id
FROM (
    VALUES
        ('CSC101', 'Introduction to Computing', 3, 'Computer Science'),
        ('CSC102', 'Database Fundamentals', 3, 'Computer Science'),
        ('BUS101', 'Principles of Management', 2, 'Business Administration'),
        ('BUS102', 'Business Communication', 2, 'Business Administration')
) AS v(course_code, course_title, credit_units, department_name)
JOIN departments d
    ON d.department_name = v.department_name;

-- 5. SEMESTERS
INSERT INTO semesters (semester_name, academic_session)
VALUES
    ('First Semester', '2025/2026'),
    ('Second Semester', '2025/2026');

-- 6. COURSE OFFERINGS
INSERT INTO course_offerings (course_code, semester_id, lecturer_id)
SELECT
    c.course_code,
    s.semester_id,
    l.lecturer_id
FROM (
    VALUES
        ('CSC101', 'First Semester', '2025/2026', 'samuel.johnson@example.com'),
        ('CSC102', 'First Semester', '2025/2026', 'samuel.johnson@example.com'),
        ('BUS101', 'Second Semester', '2025/2026', 'elizabeth.brown@example.com'),
        ('BUS102', 'Second Semester', '2025/2026', 'elizabeth.brown@example.com')
) AS v(course_code, semester_name, academic_session, lecturer_email)
JOIN courses c
    ON c.course_code = v.course_code
JOIN semesters s
    ON s.semester_name = v.semester_name
   AND s.academic_session = v.academic_session
JOIN lecturers l
    ON l.email = v.lecturer_email;

-- 7. ENROLLMENTS
INSERT INTO enrollments (student_id, offering_id, enrollment_date)
SELECT
    st.student_id,
    co.offering_id,
    v.enrollment_date
FROM (
    VALUES
        ('john.adams@example.com', 'CSC101', 'First Semester', '2025/2026', DATE '2025-09-10'),
        ('mary.james@example.com', 'CSC101', 'First Semester', '2025/2026', DATE '2025-09-11'),
        ('john.adams@example.com', 'CSC102', 'First Semester', '2025/2026', DATE '2025-09-12'),
        ('peter.daniel@example.com', 'BUS101', 'Second Semester', '2025/2026', DATE '2026-01-15'),
        ('grace.michael@example.com', 'BUS101', 'Second Semester', '2025/2026', DATE '2026-01-16'),
        ('grace.michael@example.com', 'BUS102', 'Second Semester', '2025/2026', DATE '2026-01-17')
) AS v(student_email, course_code, semester_name, academic_session, enrollment_date)
JOIN students st
    ON st.email = v.student_email
JOIN courses c
    ON c.course_code = v.course_code
JOIN semesters s
    ON s.semester_name = v.semester_name
   AND s.academic_session = v.academic_session
JOIN course_offerings co
    ON co.course_code = c.course_code
   AND co.semester_id = s.semester_id;

-- 8. RESULTS
INSERT INTO results (enrollment_id, score, grade)
SELECT
    e.enrollment_id,
    v.score,
    v.grade
FROM (
    VALUES
        ('john.adams@example.com', 'CSC101', 'First Semester', '2025/2026', 85.00, 'A'),
        ('mary.james@example.com', 'CSC101', 'First Semester', '2025/2026', 72.00, 'B'),
        ('john.adams@example.com', 'CSC102', 'First Semester', '2025/2026', 78.00, 'B'),
        ('peter.daniel@example.com', 'BUS101', 'Second Semester', '2025/2026', 68.00, 'C'),
        ('grace.michael@example.com', 'BUS101', 'Second Semester', '2025/2026', 91.00, 'A'),
        ('grace.michael@example.com', 'BUS102', 'Second Semester', '2025/2026', 82.00, 'A')
) AS v(student_email, course_code, semester_name, academic_session, score, grade)
JOIN students st
    ON st.email = v.student_email
JOIN enrollments e
    ON e.student_id = st.student_id
JOIN course_offerings co
    ON co.offering_id = e.offering_id
JOIN semesters s
    ON s.semester_id = co.semester_id
JOIN courses c
    ON c.course_code = co.course_code
WHERE c.course_code = v.course_code
  AND s.semester_name = v.semester_name
  AND s.academic_session = v.academic_session;

COMMIT;

-- =========================================================
-- END OF SAMPLE DATA INSERTION SCRIPT
-- =========================================================
