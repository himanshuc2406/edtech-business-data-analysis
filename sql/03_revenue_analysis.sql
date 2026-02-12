-- =============================================
-- 03_REVENUE_ANALYSIS.SQL
-- EDTECH BUSINESS – REVENUE PERFORMANCE
-- =============================================


-- -------------------------------------------------
-- 1. TOTAL REVENUE
-- -------------------------------------------------
SELECT 
    COUNT(*) AS total_enrollments,
    SUM(price) AS total_revenue,
    ROUND(AVG(price), 2) AS average_ticket_size
FROM enrollments;



-- -------------------------------------------------
-- 2. REVENUE BY BATCH
-- -------------------------------------------------
SELECT 
    batch_name,
    COUNT(*) AS total_enrollments,
    SUM(price) AS batch_revenue,
    ROUND(AVG(price), 2) AS average_price
FROM enrollments
GROUP BY batch_name
ORDER BY batch_revenue DESC;



-- -------------------------------------------------
-- 3. REVENUE BY MARKETING SOURCE
-- -------------------------------------------------
SELECT 
    s.source,
    COUNT(e.student_id) AS total_conversions,
    SUM(e.price) AS source_revenue,
    ROUND(AVG(e.price), 2) AS average_ticket_size
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
GROUP BY s.source
ORDER BY source_revenue DESC;



-- -------------------------------------------------
-- 4. REVENUE BY WORKING PROFESSIONAL STATUS
-- -------------------------------------------------
SELECT 
    s.working_professional,
    COUNT(e.student_id) AS total_conversions,
    SUM(e.price) AS total_revenue,
    ROUND(AVG(e.price), 2) AS average_ticket_size
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
GROUP BY s.working_professional
ORDER BY total_revenue DESC;
