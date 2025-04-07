import pandas as pd

# Replace 'your_file.csv' with your dataset filename
df = pd.read_csv(r"C:\Users\rosha\Downloads\archive (2)\Auto Sales data.csv")

# Take a first look
print(df.head())
print(df.info())

# Check for missing values
print(df.isnull().sum())

# Drop rows with too many missing values (optional)
df = df.dropna(thresh=len(df.columns) - 2)  # allow max 2 missing values per row

# Fill missing numeric columns (example: fill missing 'Price' with mean)
if 'Price' in df.columns:
    df['Price'] = df['Price'].fillna(df['Price'].mean())

df = df.drop_duplicates()


text_cols = df.select_dtypes(include='object').columns

# Strip whitespace, lowercase, and normalize common columns
for col in text_cols:
    df[col] = df[col].astype(str).str.strip().str.lower()

# Try converting all potential date columns
for col in df.columns:
    if 'date' in col.lower():
        df[col] = pd.to_datetime(df[col], errors='coerce')

df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

df.to_csv("cleaned_auto_sales_data.csv", index=False)
df.to_csv("cleaned_auto_sales_data.csv", index=False)


