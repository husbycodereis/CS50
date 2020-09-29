// Implements a dictionary's functionality

#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include <ctype.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// Number of buckets in hash table
const unsigned int N = 10000;

// Hash table
node *table[N];

// Scanned word
char scanWord[LENGTH + 1];

//total number of words
int wordCount = 0;

// Returns true if word is in dictionary else false
bool check(const char *word)
{
    
    int getWord = strlen(word);
    char copyWord[getWord + 1];
    for (int i = 0; i < getWord; i++)
    {
        copyWord[i] = tolower(word[i]);
    }
    copyWord[getWord] = '\0';
    //hash the word to compare in dictionary
    int ind = hash(copyWord);

    //set n to the index of the word
    node *cursor = table[ind];
 
    while (cursor != NULL)
    {
        //TODO --> Figüre out the logic
        int compare = strcasecmp(cursor->word, copyWord);
        if (compare == 0)
        {
            return true;
            
        }
        else
        {
            cursor = cursor->next;
        }
    }
    return false;
    

}

// Hashes word to a number

unsigned int hash(const char *word)
{
    //djb2 hash function
    unsigned long hash = 5381;
    int c;
    while ((c = *word++))
    {
        hash = ((hash << 5) + hash) + c; 
        /* hash * 33 + c */ 
    }
    
    return hash % N;
}

// Loads dictionary into memory, returning true if successful else false
bool load(const char *dictionary)
{
    //opening the dictionary
    FILE *_file = fopen(dictionary, "r");
    //checking if the dictionary is not null
    if (_file == NULL)
    {
        return false;
    }
    
    //looping through dictionary until reaching enf of file - EOF
    while (fscanf(_file, "%s", scanWord) != EOF)
    {
        //scans file one by one and creates an array for each word
        
        //allocates space for the node of each word
        node *n = malloc(sizeof(node));
        if (n == NULL)
        {
            fclose(_file);
            return false;
        }
        //copies the scanned word into the word in node
        strcpy(n->word, scanWord);
        //at first node is null
        n->next = NULL;
        //hashes the word in node
        unsigned int inde = hash(n->word);

        //checks if the table is empty or not. if empty, adds the node. if not empty, points the node first in linked list then adds the node
        if (table[inde] == NULL)
        {
            table[inde] = n;
            wordCount++;
        }
        else
        {
            n->next = table[inde];
            table[inde] = n;
            wordCount++;
        }


    }
    // TODO
    fclose(_file);
    return true;
}

// Returns number of words in dictionary if loaded else 0 if not yet loaded
unsigned int size(void)
{
    return wordCount;
}

// Unloads dictionary from memory, returning true if successful else false
bool unload(void)
{
    for (int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        node *tmp = cursor;
        while (cursor != NULL)
        {
            cursor = cursor->next;
            free(tmp);
            tmp = cursor;
        }
       
    }
    return true;
  
}
