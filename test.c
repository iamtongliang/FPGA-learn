/*
#include <iostream>
#include <vector>
#include <string>
#include <stdbool.h>

using namespace std;*/
#include <stdio.h>
#include <stdbool.h>


int main()
{
    int a, b, c;
    bool flag = false;
    
    printf("%d %d bool=%d\n",a, b, flag);
    printf("????????????????????????????0????§³?????10 \n");
    scanf("%d %d", &a, &b);
    printf("a=%d b=%d \n", a, b);
    if ( (a <0 )||(a >10 )||(b<0)||(b>10))
    {
        printf("???????\n");
        printf("???????\n");
    }
    else
    {
        /* code */
        c = a + b;
        
        printf("????????a*b??= %d\n", a^3);
    }
    return 0;

}
