#include <stdio.h>


int main()
{
    unsigned char a=0x20;

    printf("Hex code   |   Symbol\n");
    for ( int i=0x20; i<= 0x7F; i++)
    {
        printf(" 0x%02X      |   %c\n", a, a);
        a++;
    }

    return 0;

}
