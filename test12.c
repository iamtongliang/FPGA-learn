#include <stdio.h>
#include <math.h>
#include <string.h>

#define MAX_INDEX 20
#define MAX_NUMBER 10000
#define MAX_USERNUMBER 101

typedef struct 
{
   int senderID;
   int inputItemNmumber;
   int inputuserID[MAX_INDEX];
}stUserInfor;

int main(){

    int weiboNumber = 0;
    int maxUserID = 0;
    int k = 0;
    int allUserIDcount[MAX_USERNUMBER+1] = {0};
    int senderID[MAX_USERNUMBER+1] = {0};

    stUserInfor userInfor[MAX_NUMBER];

    scanf("%d",&weiboNumber);
    k = 0;
    while (k <= MAX_NUMBER && k < weiboNumber)
    {
        scanf("%d %d",&userInfor[k].senderID,
        &userInfor[k].inputItemNmumber);
        int index = 0;
        for (int i = 0; i < userInfor[k].inputItemNmumber; i++)
        {
            scanf("%d",&userInfor[k].inputuserID[i]);
            allUserIDcount[userInfor[k].inputuserID[i]]++;
        }
        k++;
    }
    int max=0;
    for (int i = 0; i < MAX_USERNUMBER+1; i++)
    {
        
        if (allUserIDcount[i] > max)
        {
            maxUserID = i;
            max = allUserIDcount[i];
        }
    }

    int index = 0;
    printf("%d\n",maxUserID);
    for (int i = 0; i <= weiboNumber; i++)
    {
        for (int j = 0; j < userInfor[i].inputItemNmumber; j++)
        {
            if (userInfor[i].inputuserID[j] == maxUserID) {
                senderID[index] = userInfor[i].senderID;
                index++;
                break;
            }
        }
        if ( index >= 1){
            for (int l=0;l<index;l++){
                if (senderID[l] > senderID[index-1]){
                    int temp = senderID[index-1];
                    for (int m=index-1;m>l;m--){
                        senderID[m] = senderID[m-1];
                    }
                    senderID[1] = temp;
                    break;
                    }
                }
            }    
    }
    for (int i = 0; i < index; i++){
        printf("%d ",senderID[i]);
    }
    printf("\n");
  }
  
