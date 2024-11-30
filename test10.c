#include <stdio.h>
#include <string.h>
#include <stdlib.h>
 
int main() {
    system("chcp 65001");
    //system("chcp 936");
    unsigned char str1[100], str2[100];

    printf("请输入第一个中文字符串: ");
    scanf("%s", (char *)str1);
 
    printf("请输入第二个中文字符串: ");
    scanf("%s", (char *)str2);
 
   //strcpy(str2, "女");
   printf("str1 len %d = . str2 len =%d\n", strlen((char *)str1), strlen((char *)str2));
   for ( int i = 0; i<strlen((char *)str1); i++ )
    printf("%02x ", str1[i]&0xff);
   printf("\n");
    if (strncmp((char *)str1, (char *)str2,strlen((char *)str2)) != 0) {
        printf("'%s' != '%s'\n", (char *)str1, (char *)str2);
    }
    else {
        printf("'%s' == '%s'\n", str1, str2);
    }
 
    if (strstr((char *)str1, (char *)str2) != NULL){
        printf("'%s' include '%s' index = %d\n", (char *)str1, (char *)str2, strstr((char *)str1, (char *)str2)-(char *)str1);
    }
    else {
        printf("'%s' notin '%s'\n", (char *)str1, (char *)str2);
    }

    return 0;
}