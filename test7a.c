#include <stdio.h>

#define MAX 10000
int main(){

    int factor[64]={0};
    int a = 0;
    int b = 1;
    int c = 0;
    int total = 1;

    scanf("%d",&b);

    //printf("%d \n",b);
    for ( c =2;c<b/2; c++){
        if ( b%c == 0){
            int j = 0;
            for ( j=0;j<a;j++){
                if ( factor[j] == c){
                    j = a+1;
                }
            }
            if ( j<=a){
                factor[a] = c;
                a++;
                factor[a] = b/c;
                a++;
                total = total + c + b/c; 
            }
        }
    }
    if ( total == b){
        printf("Yes,%d factors are 1 ", b);
        for ( c=0;c<a;c=c+2){
            printf("%2d ",factor[c]);
        }
        for ( c=a-1;c>0;c=c-2){
            printf("%2d ",factor[c]);
        }

        printf("\n");                
    }
    else{
        printf("No\n");
    }
}