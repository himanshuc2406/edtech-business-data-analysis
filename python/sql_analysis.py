import sqlite3
import pandas as pd

conn = sqlite3.connect('data/edtech.db')


#Query 1: Total student
query1 = 'select count(*) as total_students from students;'
df1 = pd.read_sql_query(query1, conn)
print('Total Students:')
print(df1)


#Query 2: Total Enrollements
query2 = 'Select count(*) as total_enrollments from enrollments;'
df2 = pd.read_sql_query(query2, conn)
print('Total Enrollement:')
print(df2)


#Query 3: Overall conversion Rate
query3 = '''
select
(select count(*) from enrollments) * 1.0/
(select count(*) from students)*100 as conversion_rate_percentage;
'''

df3 = pd.read_sql_query(query3, conn)
print('\nOverall Conversion Rate (%):')
print(df3)


#Query 4: Total Revenue
query4 = '''
select sum(price) as total_revenue from enrollments;
'''
df4 = pd.read_sql_query(query4, conn)
print('\nTotal Revenue:')
print(df4)

# Query 5 : Revenue by Batch

query5 = """
SELECT batch_name, SUM(price) AS batch_revenue
FROM enrollments
GROUP BY batch_name
ORDER BY batch_revenue DESC;
"""
df5 = pd.read_sql_query(query5, conn)
print('\nRevenue by Batch:')
print(df5)


#Query 6 : Revenue by Source

query6 = '''
select s.source, sum(e.price) as source_revenue
from enrollments as e
join students as s on e.student_id = s.student_id
group by s.source
order by source_revenue DESC;
'''
df6 = pd.read_sql_query(query6, conn)
print('\nRevenue by Source')
print(df6)

#Query 7: Conversion Rate by Source

query7 = """
SELECT 
    s.source,
    COUNT(DISTINCT e.student_id) * 1.0 / COUNT(DISTINCT s.student_id) * 100 
    AS conversion_rate_percentage
FROM students s
LEFT JOIN enrollments e 
ON s.student_id = e.student_id
GROUP BY s.source
ORDER BY conversion_rate_percentage DESC;
"""
df7 = pd.read_sql_query(query7, conn)
print('\n Conversion Rate by Source')
print(df7)


#Query 8: Conversion Rate by Working Professional
query8 = """
SELECT 
    s.working_professional,
    COUNT(DISTINCT e.student_id) * 1.0 / COUNT(DISTINCT s.student_id) * 100 
    AS conversion_rate_percentage
FROM students s
LEFT JOIN enrollments e 
ON s.student_id = e.student_id
GROUP BY s.working_professional;
"""

df8 = pd.read_sql_query(query8, conn)
print('\nConversion Rate by Working Professional')
print(df8)

#Query 9: Engagement vs Conversion

query9 = """
SELECT 
    CASE 
        WHEN ce.live_classes_attended > 20 THEN 'High Live Engagement'
        ELSE 'Low Live Engagement'
    END AS engagement_level,
    
    COUNT(DISTINCT e.student_id) * 1.0 / 
    COUNT(DISTINCT s.student_id) * 100 AS conversion_rate_percentage

FROM students s

LEFT JOIN class_engagement ce
ON s.student_id = ce.student_id

LEFT JOIN enrollments e
ON s.student_id = e.student_id

GROUP BY engagement_level;
"""
df9 = pd.read_sql_query(query9, conn)
print('\n Conversion Rate by Live Engagement Level:')
print(df9)
conn.close()