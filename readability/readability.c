#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int total_score(string paragraph);

int main(void)
{
    // get an input string
    string paragraph = get_string("What is your input? ");
    // get a score for the length of the string
    int grade_score = total_score(paragraph);
    if (grade_score < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade_score > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n",grade_score);
    }
}

int total_score(string paragraph)
{
    // Set a character counter for the word length
    int character_counter = 0;
    int index_word_counter = 0;
    int index_sentence_counter = 0;
    int char_in_words = 0;
    for (int i = 0, length = strlen(paragraph); i < length; i++)
    {
        // find the length of the longest word
        char c = paragraph[i];
        if (isalpha(c) || c == 39)
        {
            character_counter += 1;
        }
        else
        {
            if (character_counter > 0)
            {
                index_word_counter += 1;
                char_in_words += character_counter;
                if (c == '.' || c == '?' || c == '!')
                {
                    index_sentence_counter += 1;
                }
            }
            character_counter = 0;
        }
    }
    float L = ((float) char_in_words / (float) index_word_counter) * 100;
    float S = ((float) index_sentence_counter / (float) index_word_counter) * 100;
    float index = (0.0588 * L) - (0.296 * S) - 15.8;
    int final = round(index);
    return (final);
}
