#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int get_score(string word);

int main(void)
{
    // get user input
    string Player1 = get_string("Player 1: ");
    string Player2 = get_string("Player 2: ");

    // get score of each player
    int score1 = get_score(Player1);
    int score2 = get_score(Player2);

    // show the winner
    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    else if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
}

int get_score(string word)
{
    int score = 0;

    for (int i = 0, len = strlen(word); i < len; i++)
    {
        if (isupper(character))
        {
            score += POINTS[character - 'A'];
        }
        else if (islower(character))
        {
            score += POINTS[character - 'a'];
        }
    }
    return score;
}
