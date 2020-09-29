from cs50 import get_int

# main function


def main():
    height = getHeight("Height: ")
    makePyramid(height)
    
# function that asks for height


def getHeight(string):    
    while True:
        n = get_int(string)
        if n > 0 and n < 9:
            break
    return n


def makePyramid(height):
    for i in range(height):
        print(" " * (height - (i + 1)), end="")
        print("#" * (i + 1), end="")
        print(" " * 2, end="")
        print("#" * (i + 1))
        
        
# starts the main function
main()
