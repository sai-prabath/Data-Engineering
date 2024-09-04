# https://codeshare.io/yNpO0z
# JSON Exercises

'''Exercise 1: Reading a JSON File
1. Create a JSON file named `data.json` with the following content:
   {
       "name": "John Doe",
       "age": 30,
       "city": "New York",
       "skills": ["Python", "Machine Learning", "Data Analysis"]
   }
2. Write a Python script to read and print the contents of the JSON file.
'''
import json

with open("C:/Users/saipr/Documents/data.json", 'r') as file:
    data = json.load(file)
    print(data)


'''Exercise 2: Writing to a JSON File
1. Create a Python dictionary representing a person's profile:
   profile = {
       "name": "Jane Smith",
       "age": 28,
       "city": "Los Angeles",
       "hobbies": ["Photography", "Traveling", "Reading"]
   }
2. Write a Python script to save this data to a JSON file named `profile.json`.
'''

import json

profile = {
    "name": "Jane Smith",
    "age": 28,
    "city": "Los Angeles",
    "hobbies": ["Photography", "Traveling", "Reading"]
}

with open("C:/Users/saipr/Documents/data.json", 'w') as file:
    json.dump(profile, file, indent=4)


'''Exercise 3: Converting CSV to JSON
1. Using the `students.csv` file from the CSV exercises, write a Python script to read the file and convert the data to a list of dictionaries.
2. Save the list of dictionaries to a JSON file called `students.json`.
'''
import csv
import json

students = []

with open('C:/Users/saipr/Documents/students.csv', 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        students.append(row)
print(students)

with open('C:/Users/saipr/Documents/data.json', 'w') as json_file:
    json.dump(students, json_file, indent=4)


'''Exercise 4: Converting JSON to CSV
1. Using the `data.json` file from Exercise 1, write a Python script to read the JSON data.
2. Convert the JSON data to a CSV format and write it to a file named `data.csv`.
'''

import json
import csv

with open('C:/Users/saipr/Documents/data.json', 'r') as json_file:
    data = json.load(json_file)

with open('C:/Users/saipr/Documents/data.csv', 'w', newline='') as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(data.keys())
    writer.writerow(data.values())


'''Exercise 5: Nested JSON Parsing
1. Create a JSON file named `books.json` with the following content:
   {
       "books": [
           {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925},
           {"title": "War and Peace", "author": "Leo Tolstoy", "year": 1869},
           {"title": "The Catcher in the Rye", "author": "J.D. Salinger", "year": 1951}
       ]
   }
2. Write a Python script to read the JSON file and print the title of each book.
'''
import json

with open('C:/Users/saipr/Documents/books.json', 'r') as file:
    books_data = json.load(file)
    for book in books_data["books"]:
        print(book["title"])

# books.json
'''
{
    "books": [
        {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925},
        {"title": "War and Peace", "author": "Leo Tolstoy", "year": 1869},
        {"title": "The Catcher in the Rye", "author": "J.D. Salinger", "year": 1951}
    ]
}
'''

# students.csv
'''
Name,Age,Grade
Alice,20,A
Bob,21,B
Charlie,22,A
David,23,C
'''

# data.json
'''
[
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
'''

# data.csv
'''
Name,Age,Grade
Alice,20,A
'''




