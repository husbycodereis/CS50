#include <stdio.h>
#include <cs50.h>

// mario pyramid build 



int main(void)
{
    // gets a height value between 1 to 8
    int n;
    do
    {
        n = get_int("Height: ");
    }
    while (n < 1 || n > 8);
    
    // makes a for loop of n number of colons
    for (int i = 1; i <= n ; i ++)
    {
        // creates pyramdical row for each colon
        for (int j = 0 ; j <= n * 2 ; j ++)
        {
            //makes empty space on left side
            if (j < n - i)
            {
                printf(" ");
            }
            //makes pyramid colon on left side
            else if (j < n)
            {
                printf("#");
            }
            //makes space between pyramids
            else if (j == n)
            {
                printf("  ");
            }
            //makes pyramid colon on the right side
            else if (j <= n * 2 - (n - i))
            {
                printf("#");
            }
           
        }
        
        printf("\n");
    }
}