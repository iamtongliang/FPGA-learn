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
    for ( long long int i=1; i<=N; i++){
        memset(buffer, 0, sizeof(buffer));
        sprintf(buffer, "%lld", i);
        lengthOfN = strlen(buffer);
        sum += get_number_of_digits(lengthOfN, i);
        printf("i = %lld %lld\n", i,sum);
    }
    end = clock();
    printf("loop %lld cost time = %f \n", N, (double)(end-start)/CLOCKS_PER_SEC); 
    printf("%lld \n", sum%divisor);

    return 0;
}