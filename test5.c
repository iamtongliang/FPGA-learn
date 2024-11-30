#include <stdio.h>
#include <stdlib.h>

void WriteLogFile(char *log)
{
    FILE *fp;
    fp = fopen("C:\\myprojects\\cplus\\test\\test5.txt", "a");
    if (fp == NULL)
    {
        printf("Error opening file\n");
        exit(1);
    }
    fprintf(fp, "%s", log);
    fclose(fp);
}

int main() {
    int cnt = 0;
    char log[128] = {0};
    for (int i = 1000; i < 1500; i++) {
        if ( (2*i)%3 == 0 && (2*i)/3 < 1000) {
            if (i%1000/100 == (2*i)/3%100/10) { 
                if (i/1000 == i%100/10 ) {
                    printf("NINE is %d and SIX is %d and I(%d) is the same \n", i, (2*i)/3, (i)%1000/100);
                    sprintf(log,"NINE is %d and SIX is %d and I(%d) is the same \n", i, (2*i)/3, (i)%1000/100);
                    WriteLogFile(log);
                    cnt++;
                }
            }
        }            
    }

    printf("Count: %d\n", cnt);
    sprintf(log,"Count: %d\n", cnt);
    WriteLogFile(log);
    int b =5;

    scanf("%d",&b);
    int maxcharperline = 2*b-1;
    do
    {/*
        switch (b)
        {
        case 5:
            printf("*       *\n");
            break;
        case 4:
            printf("**     **\n");
            break;
        case 3:
            printf("***   ***\n");
            break;
        case 2:
            printf("**** ****\n");
            break;
        default:
            printf("*********\n");
            break;
        }
        */
       int i,j;
       j++;
       for(i=0;i<j;i++)
        printf("*");
       for(i=0;i<maxcharperline-2*j;i++)
        printf(" ");
       for(;i<maxcharperline-j;i++)
        printf("*");
        b--;
        printf("\n");
    } while (b>0);
    
}