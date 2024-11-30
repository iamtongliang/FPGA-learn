#include <stdio.h>

#define MAX 20
int main(){

    int a = 0;
    int b = 0;
    int c = 0;
    int total = 0;

    scanf("%d",&b);
    for ( c =0;c<b; c++){
        scanf("%d", &a);
        if (a<=MAX)
        {
            total = total + a;
        }
    }
/*
    while ( b>0){
        scanf("%d", &a);
        if (a<=MAX)
        {
            total = total + a;
        }
        b--;
    }*/
    printf("%d\n",total);
}