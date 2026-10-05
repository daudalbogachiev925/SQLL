import sqlite3, csv
conn = sqlite3.connect('dashboard.db')
cur = conn.cursor()

query = """
SELECT date(ts) AS day, COUNT(DISTINCT user_id) AS dau
FROM events GROUP BY day ORDER BY day
"""
rows = cur.execute(query).fetchall()

with open('dau.csv','w',newline='',encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['day','dau'])
    w.writerows(rows)

print('Готово: dau.csv')
