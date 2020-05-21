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
        printf("Usage: ./substitution key\n");
        return 1;
    }
    // checks if key is 26 letters long
    else if (strlen(argv[1]) != 26)
    {
        printf("Usage: ./substitution key with 26 letters and alphabetic characters\n");
        return 1;
    }

    // checks if command line argument is of only alphabetic characters
    int alphabet_check = 0;
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (isalpha(argv[1][i]) != 0)
        {
            alphabet_check ++;
        }
    }
    if (alphabet_check != strlen(argv[1]))
    {
        printf("Usage: ./substitution key with 26 letters and alphabetic characters\n");
        return 1;
    }
    
    // checks if there are same characters more than once 
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        int j = 0;
        while (i != j && j < strlen(argv[1]))
        {
            if (argv[1][i] == argv[1][j])
            {
                printf("Usage: ./substitution key with not same alphabetic characters\n");
                return 1;
            }
            j++;
        }
    }
    // asks for the plain text message
    string plain_text = get_string("plaintext: ");
    
    // ciphers plaintext according to the key
    for (int i = 0; i < strlen(argv[1]); i ++)
    {
        if (argv[1][i] > 96)
        {
            argv[1][i] = toupper(argv[1][i]);  
        }
        
    }
    //prints ciphertext
    printf("ciphertext: ");
    for (int i = 0; i < strlen(plain_text); i ++)
    {
        // prints exact same character if it is not an alphabetical
        if (plain_text[i] < 65 || plain_text[i] > 122)
        {
            printf("%c", plain_text[i]);
        }
        // prints a lowercase 
        else if (plain_text[i] > 96)
        {
            plain_text[i] = plain_text[i] - 32;
            printf("%c", tolower(argv[1][plain_text[i] - 65]));
        }   
        // prints an uppercase
        else
        {
            printf("%c", argv[1][plain_text[i] - 65]);
        }
    }
    printf("\n");
}