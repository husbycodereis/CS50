#include <stdio.h>
#include <cs50.h>

int main(void)
{
    // gets a number more than 9 digits
    long n;
    do
    {
        n = get_long("enter your credit card number: ");
    } while (n < 100000000);

    // sum of every other digit multiplied by 2
    long m = n / 10;

    int sum_other = 0;
    for (int i = 16; i > 0; i--)
    {
        long digit_multiply = (m % 10) * 2;
        if (digit_multiply > 9)
        {
            sum_other = sum_other + (digit_multiply % 10) + (digit_multiply / 10);
        }
        else
        {
            sum_other = sum_other + digit_multiply;
        }

        m /= 100;
    }

    // sum of all digits
    long o = n;

    int sum_rest = 0;
    for (int k = 16; k > 0; k--)
    {
        sum_rest = sum_rest + (o % 10);
        o /= 100;
    }

    int sum_total_last_digit = (sum_other + sum_rest) % 10;

    // checks the type of the the credit card
    long result = n;

    while (n >= 100)
    {
        n /= 10;
    }

    if (sum_total_last_digit != 0 || result < 100000000000)
    {
        printf("INVALID\n");
    }
    //for visa
    else if (n / 10 == 4)
    {
        printf("VISA\n");
    }
    //for american express
    else if (n == 34 || n == 37)
    {
        printf("AMEX\n");
    }
    // for mastercard
    else if (n == 51 || n == 52 || n == 53 || n == 54 || n == 55)
    {
        printf("MASTERCARD\n");
    }
    else
    {
        printf("INVALID\n");
    }
}