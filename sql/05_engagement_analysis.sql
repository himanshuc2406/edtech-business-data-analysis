-- =============================================
-- 05_ENGAGEMENT_ANALYSIS.SQL
-- EDTECH BUSINESS – BEHAVIOR & ENGAGEMENT INSIGHTS
-- =============================================


-- -------------------------------------------------
-- 1. AVERAGE LIVE ATTENDANCE BY WORKING STATUS
-- -------------------------------------------------
SELECT 
    s.working_professional,
    ROUND(AVG(ce.live_classes_attended), 2) AS avg_live_attendance
FROM students s
JOIN class_engagement ce
ON s.student_id = ce.student_id
GROUP BY s.working_professional
ORDER BY avg_live_attendance DESC;



-- -------------------------------------------------
-- 2. CONVERSION RATE BY ENGAGEMENT LEVEL
-- -------------------------------------------------
SELECT 
    CASE 
        WHEN ce.live_classes_attended > 25 THEN 'High Engagement'
        WHEN ce.live_classes_attended > 15 THEN 'Medium Engagement'
        ELSE 'Low Engagement'
    END AS engagement_level,
    
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT e.student_id) AS converted_students,
    
    ROUND(
        COUNT(DISTINCT e.student_id) * 1.0 /
        COUNT(DISTINCT s.student_id) * 100,
        2
    ) AS conversion_rate_percentage

FROM students s
JOIN class_engagement ce
ON s.student_id = ce.student_id
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY engagement_level
ORDER BY conversion_rate_percentage DESC;



-- -------------------------------------------------
-- 3. EMAIL ENGAGEMENT IMPACT ON CONVERSION
-- -------------------------------------------------
SELECT 
    CASE 
        WHEN emails_opened > 8 THEN 'High Email Engagement'
        WHEN emails_opened > 3 THEN 'Medium Email Engagement'
        ELSE 'Low Email Engagement'
    END AS email_engagement_level,
    
    COUNT(*) AS total_users,
    COUNT(CASE WHEN converted = 1 THEN 1 END) AS converted_users,
    
    ROUND(
        COUNT(CASE WHEN converted = 1 THEN 1 END) * 1.0 /
        COUNT(*) * 100,
        2
    ) AS conversion_rate_percentage

FROM email_funnel
GROUP BY email_engagement_level
ORDER BY conversion_rate_percentage DESC;
