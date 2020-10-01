from sys import argv
import csv
from cs50 import SQL


# command line argument input checker


if len(argv) != 2:
    print("Usage: python import.py characters.csv")
    exit(1)

    
# SQL database creation


db = SQL("sqlite:///students.db")


# csv file opening for read


with open(argv[-1], "r") as file:
    reader = csv.DictReader(file)
    
    for row in reader:
        nameCount = row["name"].split(' ')
        
        first = nameCount[0]
        if len(nameCount) == 3:
            middle = nameCount[1]
        else:
            middle = None
        last = nameCount[-1]
        house = row["house"]
        birth = row["birth"]
        
        db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)", first, middle, last, house, birth)