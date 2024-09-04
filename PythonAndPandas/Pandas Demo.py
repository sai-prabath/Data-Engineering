import pandas as pd

data = {
    "Name":["Amit","Priya","Vikram"],
    "Age":[23,25,22],
    "City":["Mumbai","Delhi","Chennai"]
}

df = pd.DataFrame(data)
print(df)