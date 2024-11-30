#include <stdio.h>

#define MAX 1000
int main(){
    int a[MAX]={0};
    int b = 1;
    int c = 0;
    int T = 0;
    int i = 0;

    scanf("%d",&T);
    for (int i = 0; i < T; i++)
        scanf("%d",&a[i]);
    for ( c =0;c<T; c++){
        b =a[c];
        if ( b == 2)
        {
            printf("Case #%d: %7d. Distance=     1\n", c+1, b);
            continue;;
        }
        else if ( b%2 == 0)
            b = b-1;
        //上面这段if代码，是因为偶数不是素数，所以先把偶数变成奇数，再进行后面的处理

        for ( ;b>1; b=b-2){
            //因为要找最大的那个素数，所以从最大的开始，递减找.而且b是奇数，所以每次减2
            for ( i=2;i<b; i++)
                if ( b%i == 0)
                    break;
            if ( i>=b)
            {
                printf("Case #%d: %7d. Distance=%6d\n", c+1, b, a[c]-b+1);
                //Distnace = a[c]-b+1),算一下经过多少次，就可以得到结果
                break;
            }
        }
    }
}