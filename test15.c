#include <stdio.h>
#define MAX 1000

int main(){
    int x[MAX],y[MAX],carry[MAX];
    int count = 0;
    while (count<MAX){
        scanf("%d %d",&x[count],&y[count]);
        if(x[count]== 0 &&y[count]== 0) break;
        int a,b;
        a = x[count];
        b = y[count];
        int tempcarry = 0;
        while (a>0|| b>0){

            int digitx = a%10;
            int digity = b% 10;
            int sum = digitx + digity + tempcarry;
            if(sum >= 10){
                tempcarry = 1;
                carry[count]++;
            } else {
                tempcarry = 0;
            }
            a /= 10;
            b /= 10;
        }
        count++;
    }
    for (int i = 0; i < count; i++){
        printf("%d\n",carry[i]);
    }
   return 0; 
}


