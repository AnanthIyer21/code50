#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

bool validate(string key);
string normalise(string input);
string encrypt(string key, string plaintext);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("invalid number of arguments = %d\n", argc);
        return (1);
    }
    string key = argv[1];
    if (validate(key) == false)
    {
        printf("wrong key input \n");
        return (1);
    }
    key = normalise(key);
    string plaintext = get_string("plaintext: ");
    string ciphertext = encrypt(key, plaintext);
    printf("ciphertext: %s\n", ciphertext);
}

bool validate(string key)
{
    int length = strlen(key); // get the length of the string
    if (length != 26)         // check if there are 26 letters in the key
    {
        return false;
    }
    for (int i = 0; i < length; i++)
    {
        if (isalpha(key[i]) == false)
        {
            return false;
        }
        for (int k = 0; k < i; k++)
        {
            if (key[k] == key[i])
            {
                return false;
            }
        }
    }
    return true;
}

string normalise(string input)
{
    for (int i = 0; i <= strlen(input); i++)
    {
        input[i] = toupper(input[i]);
    }
    return input;
}

string encrypt(string key, string plaintext)
{
    for (int i = 0; i < strlen(plaintext); i++)
    {
        if (isalpha(plaintext[i]))
        {
            bool is_upper = isupper(plaintext[i]);
            plaintext[i] = toupper(plaintext[i]);
            int index = plaintext[i] - 'A';
            plaintext[i] = key[index];
            if (!is_upper)
            {
                plaintext[i] = tolower(plaintext[i]);
            }
        }
    }
    return plaintext;
}
