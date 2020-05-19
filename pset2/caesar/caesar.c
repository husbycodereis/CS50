#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>


int main(int argc, string argv[1])
{
    // checks if only one command line argument is an input
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
   
    // checks if command line argument is of only digits
    int digit_check = 0;
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (isdigit(argv[1][i]) != 0)
        {
            digit_check ++;
        }
    }
    // converts string command argument into an integer
    int key = atoi(argv[1]) % 26;
    if (digit_check == strlen(argv[1]))
    {
        string word = get_string("plaintext: ");
       
        for (int i = 0; i < strlen(word); i++)
        {
            // letters between a-z lowercase
            if (word[i] >= 97 && word[i] <= 122)
            {
                if (word[i] + key > 122)
                {
                    word[i] = ((word[i] + key) % 122) + 96;
                }
                else if (word[i] + key <= 122)
                {
                    word[i] = word[i] + key;
                }
            }
            // letters between A-Z Uppercase
            else if (word[i] + key > 90)
            {
                word[i] = ((word[i] + key) % 90) + 64;
            }
            // special characters
            else if (word[i] < 65)
            {
                word[i] = word[i];
            }
            // rest of the charactesr
            else 
            {
                word[i] = word[i] + key;
            }
        }
        printf("ciphertext: %s\n", word);
    }
    // returns back to command if none above condition is met
    else
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
}

