-- =============================================
-- 01_OVERVIEW.SQL
-- EDTECH BUSINESS – CORE FUNNEL METRICS
-- =============================================

-- ---------------------------------------------
-- 1. TOTAL STUDENTS ACQUIRED
-- ---------------------------------------------
SELECT 
    COUNT(DISTINCT student_id) AS total_students
FROM students;


-- ---------------------------------------------
-- 2. TOTAL PAID ENROLLMENTS
-- ---------------------------------------------
SELECT 
    COUNT(DISTINCT student_id) AS total_enrollments
FROM enrollments;


-- ---------------------------------------------
-- 3. OVERALL CONVERSION RATE (%)
-- ---------------------------------------------
SELECT 
    ROUND(
        COUNT(DISTINCT e.student_id) * 1.0 /
        COUNT(DISTINCT s.student_id) * 100,
        2
    ) AS conversion_rate_percentage
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id;


-- ---------------------------------------------
-- 4. TOTAL REVENUE GENERATED
-- ---------------------------------------------
SELECT 
    SUM(price) AS total_revenue
FROM enrollments;
