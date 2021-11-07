#include "NumClass.h"
#include <stdio.h>


// int isPrime(int n);
// int isArmstrong(int n);
// int isStrong(int n);
// int isPalindrome(int n);

int main() {

    int x, y;
    scanf("%d %d", &x, &y);

    if(x<=y) {
        for(int i=x ; i<=y ; i++) {
            if(isPrime(i)==1)
                printf("%d ", i);
        }
        printf("\n\n");
        for(int i=x ; i<=y ; i++) {
            if(isArmstrong(i)==1)
                printf("%d ", i);
        }
        printf("\n\n");
        for(int i=x ; i<=y ; i++) {
            if(isStrong(i))
                printf("%d ", i);
        }
        printf("\n\n");
        for(int i=x ; i<=y ; i++) {
            if(isPalindrome(i)==1)
                printf("%d ", i);
        }
        printf("\n\n");
    }
    else {
        for(int i=y ; i<=x ; i++) {
            if(isPrime(i)==1)
                printf("%d ", i);
        }
        printf("\n");
        for(int i=y ; i<=x ; i++) {
            if(isArmstrong(i)==1)
                printf("%d ", i);
        }
        printf("\n");
        for(int i=y ; i<=x ; i++) {
            if(isStrong(i))
                printf("%d ", i);
        }
        printf("\n");
        for(int i=y ; i<=x ; i++) {
            if(isPalindrome(i)==1)
                printf("%d ", i);
        }
        printf("\n");
    }
}
