#include <stdio.h>
#include <math.h>

#define MAX_N 2*100
#define MAX_Pi MAX_N-1

int happy_martix[MAX_N][3];
int P[MAX_N];
int N;

int getHappyCount(int i){
    int stepcount = 0;
    int happycount = 0;

    if ( P[i] >= i ) stepcount = P[i]-i+1;
    else stepcount = N-i+P[i]+1;
  
    for ( int j = 0; j < N; j++){
        int pi= P[(j+stepcount)%N];
        if ( pi == happy_martix[j][0] || pi == happy_martix[j][1] || pi == happy_martix[j][2]  ) happycount++;
        
    }
    return happycount;
}
int main(){
    int i, j, k;
    int happy_count[MAX_N];
    
    scanf("%d", &N);

    for ( i = 0; i < N; i++){
        happy_count[i] = 0;
        P[i] = 0;
        if ( i== 0 ) happy_martix[i][0] =N-1;
            else happy_martix[i][0] = i-1;
        happy_martix[i][1] = i;
        if ( i == N-1 ) happy_martix[i][2] = 0;
            else happy_martix[i][2] = i+1;
    }

    for (k = 0; k < N; k++){
        scanf("%d", &P[k]);
    }

    int max = 0;
    for ( i = 0; i < N; i++)
    {       
        happy_count[i] = getHappyCount(i);
        if ( happy_count[i] > max ) max = happy_count[i];
    }

    printf("%d\n", max);
    return 0; 
}


