import pandas as pd
data = {
    "Product": ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Phone'],
    "Category": ['Electronics', 'Accessories', 'Electronics', 'Accessories', 'Electronics'],
    "Price": [80000, 1500, 20000, 3000, 40000],
    "Quantity": [10, 100, 50, 75, 30]
}

df = pd.DataFrame(data)

df_copy = df
df_copy.loc[2, "Price"] = None
df_copy.loc[4, "Price"] = None

df_copy["Price"] = df_copy["Price"].fillna(df_copy["Price"].mean()) # df_copy.update(df_copy["Price"].fillna(df_copy["Price"].mean()))
print(df_copy)

df_copy = df_copy[df_copy["Quantity"] >= 50]
print(df_copy)

