#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <math.h>

int count_letters(string text_get);
int count_words(string text_get);
int count_sentences(string text_get);

int main(void)
{
    // getting user input
    string text_get = get_string("Text: ");


    // average number of lettters in 100 words
    float L = ((float)count_letters(text_get) * 100) / (float)count_words(text_get);
    // average number of sentences in 100 words
    float S = ((float)count_sentences(text_get) * 100) / (float)count_words(text_get);
    // Coleman-Liau index
    float index = 0.0588 * L - 0.296 * S - 15.8;
    //  grade printing conditions
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %.0f\n", roundf(index));
    }

}


//function that counts letters
int count_letters(string text_get)
{
    int total_letters = 0;
    for (int i = 0; i < strlen(text_get); i ++)
    {
        if (text_get[i] >= 'A' &&  text_get[i] <= 'z')
        {
            total_letters ++;
        }
    }
    return total_letters;
}

//function that counts words

int count_words(string text_get)
{
    int total_words = 1;
    for (int i = 0; i < strlen(text_get); i++)
    {
        if (text_get[i] == ' ')
        {
            total_words ++;
        }
    }
    return total_words;
}

//funtion that counts sentences

int count_sentences(string text_get)
{
    int total_sentences = 0;
    for (int i = 0; i < strlen(text_get); i++)
    {
        if (text_get[i] == '.' || text_get[i] == '!' || text_get[i] == '?')
        {
            total_sentences ++;
        }
    }
    return total_sentences;
}

