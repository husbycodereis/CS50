from cs50 import get_string
import re

# main function


def main():
    
    getText = get_string("Text: ") 
    totalLetters = letterCount(getText)
    totalWords = wordCount(getText)
    totalSentences = sentenceCount(getText)
    L = (totalLetters * 100) / totalWords
    S = (totalSentences * 100) / totalWords
    index = 0.0588 * L - 0.296 * S - 15.8
    
    if index < 1:
        print("Before Grade 1")
    elif index >= 16:
        print("Grade 16+")
    else:
        print(f"Grade {round(index)}")
    
   
# function that counts letters in a sentence
def letterCount(text):
    words = text.split(" ")
    letter = 0
    for word in words:
        for i in word:
            if i.isalpha():
                letter += 1
    return letter


# function that counts words


def wordCount(text):
    return len(text.split(" "))

# function that ocunts sentences


def sentenceCount(text):
    words = text.split(" ")
    sentence = 0
    for word in words:
        for i in word:
            if i == "." or i == "!" or i == "?":
                sentence += 1
    return sentence
 
    
main()
