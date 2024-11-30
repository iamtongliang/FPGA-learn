#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <wchar.h>

 
int main() {
    system("chcp 65001");
    wchar_t str1[100], str2[100];

    printf("主串: ");
    wscanf(L"%ls", &str1);
 
    printf("字串: ");
    wscanf(L"%ls", str2);
 
    wprintf(L"str1 = %ls, str2 = %ls\n", str1, str2);
    for (int i = 0; i < wcslen(str1); i++) {
        wprintf(L"%02x ", str1[i]);
    }
    printf("\n");
    for (int j = 0; j < wcslen(str2); j++) {
        wprintf(L"%02x ", str2[j]);
    }
    printf("\n");

   printf("str1 len %d = . str2 len =%d\n", wcslen(str1), wcslen(str2));

    if (wcsstr(str1, str2) != NULL){
        wprintf(L"'%ls' in '%ls' index = %d\n", str2, str1, wcsstr(str1, str2)-str1);
        if (wcsncmp(&str1[wcsstr(str1, str2)-str1], str2,wcslen(str2)) != 0) {
            wprintf(L"'%ls' not in'%ls'\n", str2, str1);
        }
        else {
            wprintf(L"sub '%ls' in '%ls' (%ls)\n", str2, str1, &str1[wcsstr(str1, str2)-str1]);
        }
    }
    else {
        wprintf(L"'%ls' notin '%ls'\n", str1, str2);
    }
 
    return 0;
}