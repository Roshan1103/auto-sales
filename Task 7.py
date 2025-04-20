import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Step 1: Connect to SQLite DB (creates one if not exists)
conn = sqlite3.connect("sales_data.db")
cursor = conn.cursor()

# Step 2: Create a sample sales table (if it doesn't exist)
cursor.execute('''
CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product TEXT,
    quantity INTEGER,
    price REAL
)
''')

# Step 3: Insert sample data (only if table is empty)
cursor.execute("SELECT COUNT(*) FROM sales")
if cursor.fetchone()[0] == 0:
    sample_data = [
        ('Laptop', 5, 50000),
        ('Mouse', 20, 500),
        ('Keyboard', 15, 800),
        ('Monitor', 7, 12000),
        ('Laptop', 3, 52000),
        ('Mouse', 10, 550),
    ]
    cursor.executemany("INSERT INTO sales (product, quantity, price) VALUES (?, ?, ?)", sample_data)
    conn.commit()

# Step 4: SQL query to get total quantity and revenue
query = '''
SELECT 
    product, 
    SUM(quantity) AS total_qty, 
    SUM(quantity * price) AS revenue
FROM 
    sales
GROUP BY 
    product
'''

# Step 5: Load results into a DataFrame
df = pd.read_sql_query(query, conn)

# Step 6: Print the summary
print("\nSales Summary:\n")
print(df)

# Step 7: Plot revenue per product
plt.figure(figsize=(8, 5))
df.plot(kind='bar', x='product', y='revenue', color='skyblue', legend=False)
plt.title("Revenue by Product")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.grid(axis='y')
plt.tight_layout()
plt.savefig("sales_chart.png")  # Optional: Save chart
plt.show()

# Close connection
conn.close()
