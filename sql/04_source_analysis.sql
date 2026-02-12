-- =============================================
-- 04_SOURCE_ANALYSIS.SQL
-- EDTECH BUSINESS – ACQUISITION & CONVERSION ANALYSIS
-- =============================================


-- -------------------------------------------------
-- 1. STUDENT DISTRIBUTION BY SOURCE
-- -------------------------------------------------
SELECT 
    source,
    COUNT(*) AS total_students
FROM students
GROUP BY source
ORDER BY total_students DESC;



-- -------------------------------------------------
-- 2. CONVERSION RATE BY SOURCE
-- -------------------------------------------------
SELECT 
    s.source,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT e.student_id) AS converted_students,
    ROUND(
        COUNT(DISTINCT e.student_id) * 1.0 /
        COUNT(DISTINCT s.student_id) * 100,
        2
    ) AS conversion_rate_percentage
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.source
ORDER BY conversion_rate_percentage DESC;



-- -------------------------------------------------
-- 3. REVENUE PER STUDENT (QUALITY METRIC)
-- -------------------------------------------------
SELECT 
    s.source,
    ROUND(
        SUM(e.price) * 1.0 /
        COUNT(DISTINCT s.student_id),
        2
    ) AS revenue_per_acquired_student
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.source
ORDER BY revenue_per_acquired_student DESC;



-- -------------------------------------------------
-- 4. AVERAGE TICKET SIZE BY SOURCE
-- -------------------------------------------------
SELECT 
    s.source,
    ROUND(AVG(e.price), 2) AS average_ticket_size
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
GROUP BY s.source
ORDER BY average_ticket_size DESC;
