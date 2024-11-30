#include <stdio.h>
#include <math.h>

int main(){

    int m = 0;
    scanf("%d",&m);
    int result = m;
    long long int sum;

    int i = sizeof(sum);
   
    sum = pow(-2,63)/1;
    double a = pow(2,100);
    while ( result != 1 )
    {
        
        if ( result %2 == 0){
            printf("%d/2=%d\n",result, result/2 );
            result = result/2;
        }
        else{
            printf("%d*3+1=%d\n",result, result*3+1 );
            result = result*3+1;
        }        
    }
    
    if ( 1== result || 1 == m){
        printf("End.\n" );
    }
/*
    switch (result)
    {
    case 90:
    case 91:
    case 92:
        break;
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
        break;
    
    default:
        break;
    }
    */
}