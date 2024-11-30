#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>

#define divisor 998244353

long long int get_number_of_digits(int digitNumber,long long int input) {
    long long int beginDigit = pow(10, digitNumber-1);
    long long int number = input - beginDigit + 1;

    return number;
}

int main() {
    long long int N;
    
    scanf("%lld", &N);
   
    char buffer[19]="0";
    
    int lengthOfN = 0;
    long long int sum = 0;
    time_t start, end;
    start = clock();
    if ( N<=9 ) {
        for (int i=0; i<=N; i++) {
            sum += i;
        }
    }else {
        sum  =0;
        char buffer[19]="0";
        sprintf(buffer, "%lld", N);
        int len= strlen(buffer);
        long long int loopconuter;
        for (int i=1; i<=len; i++) {
            if ( i!=len ) 
                loopconuter = pow(10, i)-pow(10, i-1);
            else
                loopconuter = N-pow(10, i-1)+1;
            //for (long long int j =1; j<=loopconuter; j++) 
                sum += loopconuter*(loopconuter+1)/2;
        }
    }
    end = clock();
    printf("loop %lld cost time = %f \n", N, (double)(end-start)/CLOCKS_PER_SEC); 
    printf("%lld \n", sum%divisor);

    return 0;
}