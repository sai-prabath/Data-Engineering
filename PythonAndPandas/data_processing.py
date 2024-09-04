import pandas as pd
import numpy as np
from pandas import DataFrame

df = pd.read_csv("sample_data.csv")

# check null values (none/NaN)

print(df.isnull().sum())            # column
print(df[df.isnull().any(axis=1)])  # row

# replace empty -> NaN

df.replace(r'^\s*$',np.nan, regex=True, inplace=True)
print(df.isnull().sum())            # column
print(df[df.isnull().any(axis=1)])  # row

# drop any missing data

df_cleaned = df.dropna()
print(df_cleaned)

# filling data

df.columns = df.columns.str.strip()       # remove spaces before and after

df["City"] = df["City"].str.strip().replace('',np.nan) # '    ' -> '' -> NaN
df["City"] = df["City"].fillna('Unknown')
print(df)

df["Age"] = pd.to_numeric(df["Age"].str.strip(), errors='coerce')  # ' 29 ' -> '29' -> 29 (string - int)
df["Age"] = df["Age"].fillna(df["Age"].median())

df["Salary"] = df["Salary"].fillna(df["Salary"].median())

print(df)



