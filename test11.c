#include <stdio.h>
#include <math.h>
#include <string.h>

#define MAX_INDEX 20

void print_sequence(unsigned long long int sequence, int index){

    char buffer[MAX_INDEX]={0};
    char buffercomma[MAX_INDEX+10]={0};
   
    sprintf(buffer, "%3lld", sequence);
    int len = strlen(buffer);
    int start = 0;
    int loopcount = 0;
    if ( len%3 == 0){
        loopcount = len/3;
    }else{
        loopcount = len/3 + 1;
        start = 3-loopcount/3;
    }
    strncpy(buffercomma, buffer, len-(loopcount-1)*3);   
    for (int i = 1; i < loopcount; i++){
        strcat(buffercomma, ",");
        strncpy(&buffercomma[strlen(buffercomma)], &buffer[i*3-start], 3);  
    }
    
    printf("sequence %s\n", buffercomma);
       
}

int main(){

    int K = 1;
    

    unsigned long long int sequence = 7;
    int index = 0;
    scanf("%d",&K);
    index = 1;
    sequence = 0;
    int j=0;
    for ( j = 0; j < K; j++)
    {
        sequence = ((sequence*10) + 7)%K;
        printf("currect sequence is (%lld)\n ", sequence);  
        if ( sequence == 0 ){
            print_sequence(sequence, index);
            printf("sequence(%lld)/K(%d) = %lld @location= %d \n", sequence, K, sequence/K , j);  
            printf("++++++++++++++++++++++++++++++++++++++++++\n");             
            break;
        }        
    }
    if (j >= K){
        printf("-1\n");
    }
  }