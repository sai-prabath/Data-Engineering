import pandas as pd

from Dict_Exercises import employees

data1 = [
    {
        "Name": "Alice",
        "Age": "20",
        "Grade": "A"
    },
    {
        "Name": "Bob",
        "Age": "21",
        "Grade": "B"
    },
    {
        "Name": "Charlie",
        "Age": "22",
        "Grade": "A"
    },
    {
        "Name": "David",
        "Age": "23",
        "Grade": "C"
    }
]

data = {
    "Name":["Amit","Priya","Vikram"],
    "Age":[23,25,22],
    "City":["Mumbai","Delhi","Delhi"]
}

#df = pd.DataFrame(data)
#print(df)

#print(df["Name"]) #single column
#print(df[["Name","Age"]]) #multiple column
#print(df.iloc[0]) #first row
#print(df.iloc[0:2]) #multiple row

#filter1 = df[df["Age"]>22] # filtering
#print(filter1)

#df["Salary"] = [20000,30000,27000] # add column
#print(df)

#sorted_df = df.sort_values(by="Age", ascending=False) # sorting
#print(sorted_df)

#renamed_df = df.rename(columns={"Name":"FullName","Age":"Years"}) # rename columns
#print(df,'\n',renamed_df)

#dropped_df = df.drop(columns=["City"]) # deleting column
#print(dropped_df)

#dropped_row_df = df.drop(index=1) # deleting row
#df_droprow = df_droprow.reset_index(drop=True) # reser row numbers
#print(df,'\n',dropped_row_df)

#df["Seniority"] = df["Age"].apply(lambda x: 'Senior' if x>22 else 'Junior') # new column with condition
#print(df)

#grouped_df = df.groupby("City")["Salary"].sum() #grouping data
#print(grouped_df)

'''
def add_bonus(salary):
    return salary*1.10
df["Bonus"] = df["Salary"].apply(add_bonus) # using own functions
print(df)
'''

df_new = pd.DataFrame(
    {
        "Name":["Amit","Priya","Ravi"],
        "Bonus":[4000,3000,2000]
    }
)

#merged_df = pd.merge(df, df_new, on="Name", how="left") # join
#print(merged_df)

df_concat = pd.DataFrame(
    {
        "Name":["Sai","Veer"],
        "Age":[21,19],
        "City":["Bangalore","Chennai"],
        "Salary":[40000,42000]
    }
)

#concat_df = pd.concat([df,df_concat], ignore_index=True)
#print(concat_df)

#print(concat_df[concat_df["Salary"]>20000])
#print(concat_df[concat_df["Name"].str.startswith('S')])

#df = pd.read_csv('employees.csv')
#print(df)
#print(df.head(4)) # first N (4 here) rows
#print(df.info()) # datatypes , count of not null values
#print(df.describe()) # all statistics if int datatype

#df = pd.read_json('employees.json')
#df["bonus"] = df["Salary"]+0.10
#print(df)
#df.to_json('employees_with_bonus.json', orient='records', lines=True)

