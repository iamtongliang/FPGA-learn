#include <stdio.h>

#define MAX 10000
int main(){

    int factor[64]={0};
    int a = 0;
    int b = 1;
    int c = 0;
    int total = 0;

    scanf("%d",&b);
    a = 0;
    total = 0;
    //printf("%d \n",b);
    for ( c =1;c<b; c++){
        if ( b%c == 0){
            factor[a] = c;
            a++;
            total = total + c;
        }
    }
    if ( total == b){
        printf("Yes,%d factors are ", b);
        for ( c=0;c<a;c++)
            printf("%2d ",factor[c]);
        
        printf("\n");                
    }
    else{
        //printf("No");
    }
}