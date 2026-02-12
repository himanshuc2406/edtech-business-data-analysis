-- =============================================
-- 02_CONVERSION_ANALYSIS.SQL
-- EDTECH BUSINESS – CONVERSION SEGMENTATION
-- =============================================


-- -------------------------------------------------
-- 1. CONVERSION RATE BY MARKETING SOURCE
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
-- 2. CONVERSION RATE BY WORKING PROFESSIONAL STATUS
-- -------------------------------------------------
SELECT 
    s.working_professional,
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
GROUP BY s.working_professional
ORDER BY conversion_rate_percentage DESC;
