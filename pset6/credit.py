from cs50 import get_int
import re


def main():
    cardNumber = getCard("Enter your card number: ")
    totalSum = checkCard(cardNumber)
    checkType(totalSum, cardNumber)
    
# function that asks for height


def getCard(string):    
    while True:
        n = get_int(string)
        if n >= 100000000:
            break
    return n


def checkCard(value):
    valueList = list(map(int, str(value)))
    valueList.reverse()
    # define function two multiply by two
    
    def timesTwo(x):
        return x * 2
    
    oddValueList = list(map(timesTwo, valueList[1::2]))
    evenValueList = list(map(int, valueList[::2]))
    # function sum all digits of array 
    
    def sumDigit(x):
        if x > 9:
            y = list(map(int, str(x)))
            z = sum(y)
            return z
        else:
            return x
        
    oddValueList = list(map(sumDigit, oddValueList))
    totalSum = (sum(oddValueList) + sum(evenValueList)) % 10
    return totalSum


def checkType(val, num):   
    s = str(num)
    if val != 0 or num < 100000000000:
        print("INVALID")
    elif re.search("^4", s):
        print("VISA")
    elif re.search("^3[47]", s):
        print("AMEX")
    elif re.search("^5[12345]", s):
        print("MASTERCARD")
    else:
        print("INVALID")
        
        
main()
