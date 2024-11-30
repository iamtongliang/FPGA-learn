#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    char a=0x07;
    char s[32];
    printf("十进制 |原码 |补码 \n");
    for ( int i=0; i<=7; i++)
    {
        itoa(a,s,2);// 将整数a转换为二进制字符串表示
        printf("%4d | %04s | %04s  \n",a,s,s);
        a--;
        memset(s, 0, sizeof(s));   
    }

    for (  int i=1; i<= 8; i++)
    {
        unsigned char b;
        b = (unsigned char)(i&0x0f|0x08);
        itoa(i,s,2);// 将整数转换为二进制字符串表示
        if ( i == 1 )
            printf("%4d | 1%03s |",-i, s);
        else
            printf("%3d | 1%03s |",-i, s);
        memset(s, 0, sizeof(s));   
        itoa(-i,s,2);// 将整数转换为二进制字符串表示
        printf(" %4s \n ",&s[28]);
        memset(s, 0, sizeof(s));    
    }

    return 0;

}
