#include <stdio.h>

#define MAX 10000
int main(){

    int m = 0;
    int n = 0;
    int i = 0;
    int c = 0;
    int max=0;
    int a=0;


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
        for ( c =2;c<i/2+1; c++){
            if ( i%c == 0){
                a =-1;
                break;
            }
        }
        if ( 0 == a){
            printf("%d ",i);
        }
    }
 

}