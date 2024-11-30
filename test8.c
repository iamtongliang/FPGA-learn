#include <stdio.h>

#define MAX 10000
int main(){

    int factor[64]={0};
    int m = 0;
    int n = 0;
    int i = 0;
    int c = 0;
    int max=0;
    int total = 0, a=0;


    scanf("%d %d",&m,&n);
    if ( m<n){
        i = m;
        max = n;
    }
    else{
        i = n;
        max = m;
    }


    for (; i<=max; i++){
        a = 0;
        for ( c =1;c<=i; c++){
            if ( i%c == 0){
                factor[a] = c;
                a++;
            }
        }
        if ( 2 == a){
            if ( factor[0] == 1 && factor[1] == i){
                printf("%d ",i);
            }
        }
        for ( c=0;c<64;c++)
            factor[c] = 0;
    }
 

}