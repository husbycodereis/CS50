from cs50 import SQL
from sys import argv


# SQL database creation


db = SQL("sqlite:///students.db")


# checking command line argument


if len(argv) != 2:
    print("Usage: python roster.py Gryffindor")
    exit(1)


# creating sql selection   

house = argv[1]
print(house)
rows = db.execute("SELECT first,middle,last,birth FROM students WHERE house = ? ORDER BY last,first;", house)


# creating the print format


for row in rows:
    if row["middle"] == None:
        print(row["first"] + " " + row["last"] + ", born " + str(row["birth"]))
    else:
        print(row["first"] + " " + row["middle"] + " " + row["last"] + ", born " + str(row["birth"]))
