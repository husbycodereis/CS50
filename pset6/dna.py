from sys import argv
import re
import csv

# command line argument input checker
if len(argv) != 3:
    print("Usage: python dna.py data.csv sequence.txt")
elif re.search("^((?!csv).)*$", argv[1]):
    print("Usage: python dna.py data.csv sequence.txt")
elif re.search("^(?!sequence)", argv[2]):
    print("Usage: python dna.py data.csv sequence.txt")
    
# reading the csv file with csv.reader 
dna = []
with open(argv[1], 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        dna.append(dict(row))
        
        
# opening the DNA file and reading it to memory
f = open(argv[2], 'r')
result = f.read()

# constants
copyResult = []
nameList = []
dnaList = []
counterList = []




# get the index of the first letter that starts with regex value
def main():
    # cut names from the dictionaries and make an individual list    
    for dicts in dna:
        nameList.append(dicts["name"])
        dicts.pop("name") 
    # add keys into a seperate list    
    dnaList = list(dna[0].keys())
    
    # createing a loop that iterates each dictionary of dna's
    for dnas in dnaList:
        biggest = []
        dnaCounter = 0
        index = 0
        # checks if the sequence includes the DNA sample for once
        if re.search(rf"{dnas}", result):
            dnaCounter += 1
            x = result.find(dnas)
            copyResult = result[x + len(dnas):]
            # creating a while loop that checks if the sequence has consequtive same DNA
            while len(copyResult) > 0:
                if copyResult.startswith(dnas):
                    x = copyResult.find(dnas)
                    copyResult = copyResult[x + len(dnas):]    
                    dnaCounter += 1
                    biggest.append(dnaCounter)
                # condition to check other DNA sample in different locations of the sequence
                elif dnas in copyResult:
                    dnaCounter = 1
                    x = copyResult.find(dnas)
                    copyResult = copyResult[x + len(dnas):]
                # getting the biggest value of dnaCounter to mark as the highest repetitive DNA line in sequence    
                else:
                    biggest.append(1)
                    copyResult = []
                    counterList.append(max(biggest)) 
        else:
            counterList.append(dnaCounter)
            
    
# matching the values of the dictionaries
    counter = 0
    ind = 0
    # creating lists from values of the dictionary, converting them to integers to match the original list 
    for dicts in dna:
        dictList = []
        dictList = list(dicts.values())
        dictList = [int(i) for i in dictList] 
        #if the values match, returns the value of the name in the given index
        if dictList == counterList:
            print(nameList[ind])
            counter += 1
        ind += 1
        
    if counter == 0:
        print("No match")
main()





