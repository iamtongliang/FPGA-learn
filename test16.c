#include <stdio.h>
#include <time.h>
int main(){
    long long l,r, i ,j;
    while (1) {
        scanf("%lld %lld",&l,&r);
        int a,min;
        min = 2018;
        time_t start, end;
        start = clock();
        for( i=l;i<=r-1;i++){
            for( j=i+1;j<=r;j++){
                a=(i*j)%2019;
                if ( 0!=a ){
                    if (a<min)
                        min=a;
                }
                else{
                    min=0;
                    break;
                    }
            }
            if (0==min) 
                break;
        }
        end = clock();
        printf("when (%d %d) mod 2019 = %d: div 2019 = %d %f\n",i,j,min, i*j/2019,(end - start));    
          
    }
}