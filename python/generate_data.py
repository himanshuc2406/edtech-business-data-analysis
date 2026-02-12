import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

# Set Seed for reproducibility
np.random.seed(42)
random.seed(42)

# Number of Students
num_students = 10000

# Generate student IDs
student_ids = np.arange(1, num_students + 1)

# Signups dates (last 1 year)
start_date = datetime(2025, 1, 1)
signup_dates = [start_date + timedelta(days=random.randint(0, 365)) for _ in range(num_students)]

# Marketing source
source = ['Youtube', 'Telegram', 'Email', 'Ads', 'Referral', 'Organic']
student_sources = np.random.choice(source, num_students)

# States
states = ['UP', 'Delhi', 'Bihar', 'Rajasthan', 'Maharashtra', 'MP']
student_states = np.random.choice(states, num_students)

# Working Professional flag
working_professional = np.random.choice([True, False], num_students, p=[0.4, 0.6])

# Create Students DataFrame
students_df = pd.DataFrame({
    'student_id': student_ids,
    'signup_date': signup_dates,
    'source': student_sources,
    'state': student_states,
    'working_professional': working_professional
})

students_df.to_csv('data/students.csv', index=False)

print('Student dataset created successfully!')
print(students_df.head())


# -----------------------------
# Generate Class Engagement Dataset (FOR ALL STUDENTS)
# -----------------------------

engagement_data = []

for i in range(num_students):
    
    total_classes = random.choice([40, 50, 60])
    
    working_flag = working_professional[i]
    
    if working_flag:
        live_attended = random.randint(5, 25)
        recorded_views = random.randint(15, total_classes)
    else:
        live_attended = random.randint(10, 35)
        recorded_views = random.randint(5, 25)
    
    engagement_data.append({
        "student_id": student_ids[i],
        "live_classes_attended": live_attended,
        "recorded_views": recorded_views,
        "total_classes": total_classes
    })

engagement_df = pd.DataFrame(engagement_data)
engagement_df.to_csv("data/class_engagement.csv", index=False)

print("Engagement dataset created successfully!")
print(engagement_df.head())


# -----------------------------
# Generate Enrollments Dataset (Conversion based on Engagement)
# -----------------------------

batches = ['RBI Grade B', 'SEBI', 'NABARD', 'SSC CGL', 'Banking']

enrollments_data = []

for i in range(num_students):
    
    live_attended = engagement_df.loc[i, "live_classes_attended"]
    
    # Engagement-based conversion probability
    if live_attended > 25:
        conversion_prob = 0.85
    elif live_attended > 15:
        conversion_prob = 0.60
    else:
        conversion_prob = 0.25
    
    if random.random() < conversion_prob:
        enrollments_data.append({
            'student_id': student_ids[i],
            'batch_name': random.choice(batches),
            'price': random.choice([4999, 7999, 9999, 11999]),
            'payment_type': random.choice(['Full Payment', 'EMI'])
        })

enrollments_df = pd.DataFrame(enrollments_data)
enrollments_df.to_csv('data/enrollments.csv', index=False)

print('Enrollments dataset created successfully!')
print(enrollments_df.head())


# ------------------------------
# Generate Email Funnel Dataset
# ------------------------------

email_data = []

for i in range(num_students):
    student_id = student_ids[i]

    emails_opened = random.randint(0, 15)
    links_clicked = random.randint(0, emails_opened) if emails_opened > 0 else 0

    # Engagement Score (simple weighted model)
    engagement_score = (emails_opened * 0.05) + (links_clicked * 0.1)

    # Cap probability between 0 and 0.85
    conversion_prob = min(engagement_score, 0.85)

    converted = random.random() < conversion_prob

    email_data.append({
        'student_id': student_id,
        'emails_opened': emails_opened,
        'links_clicked': links_clicked,
        'converted': converted
    })

email_df = pd.DataFrame(email_data)

email_df.to_csv('data/email_funnel.csv', index=False)

print('Email funnel dataset created successfully!')
print(email_df.head())


# ------------------------------
# Load into SQLite
# ------------------------------

import sqlite3

conn = sqlite3.connect('data/edtech.db')

students_df.to_sql('students', conn, if_exists='replace', index=False)
engagement_df.to_sql('class_engagement', conn, if_exists='replace', index=False)
enrollments_df.to_sql('enrollments', conn, if_exists='replace', index=False)
email_df.to_sql('email_funnel', conn, if_exists='replace', index=False)

conn.close()

print('All datasets loaded into SQLite database successfully!')
