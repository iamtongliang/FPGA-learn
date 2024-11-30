#include <stdio.h>
#include <math.h>

#define MAX_N 50
#define MAX_M MAX_N*(MAX_N-1)/2

int main(){

    int N=2,M=0;
    int A[MAX_M],B[MAX_M];
    int i,j,k;

    int stronger[MAX_M];

    scanf("%d %d", &N, &M);

    for (k = 0; k < M; k++){
        scanf("%d %d", &A[k], &B[k]);
    }
    
    for (i = 0; i < M; i++){  
        stronger[i] = A[i];      
        for (j = 0; j < M; j++){
            if (A[i] != B[j]) continue;
            else {
                stronger[i] = A[j];
                break;
            }
        }
    }

    int result;
    for (i = 0; i <M-1; i++){
        result =stronger[i];
        if (stronger[i] == stronger[i+1]) continue;
        else {
            result =-1;
            break;
        }
    }
    printf("%d\n", result);
    return 0; 
}


