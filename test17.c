#include <stdio.h>
#include <math.h>

#define MAX_N 3*100000
#define MAX_A 200

int main(){
    int result1 = 0, result2=0;
    int i, j, k;

    int N;
    int A[MAX_N];

    scanf("%d", &N);

    for (k = 0; k < N; k++){
        scanf("%d", &A[k]);
    }

    for ( i = 1; i < N; i++)
    {       
        for ( j = 0; j<i; j++)
        {
            result1 += pow((A[i] - A[j]), 2);
        }
        result2 +=result1;
        result1 =0 ;
        
    }
    printf("%d\n", result2);
    return 0; 
}


