#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int x = -1;
    while (x <= 0)
    {
        x = get_int("How many levels do you want? ");
    }
    for (int i = 1; i <= x; i++)
    {
        int y = x - i;
        for (int j = 0; j < y; j++)
        {
            printf(" ");
        }
        for (int k = 0; k < i; k++)
        {
            printf("#");
        }
        printf("  ");
        for (int k = 0; k < i; k++)
        {
            printf("#");
        }
        printf("\n");
    }
}
