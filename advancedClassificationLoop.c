#include "NumClass.h"
#include <stdio.h>

int isPalindrome(int n) {
    int reversed = 0;
    int original = n;
    int remainder = 0;
    while(n>0){
        remainder = n % 10;
        reversed = reversed * 10 + remainder;
        n /= 10;
    }
    if(original==reversed){
        return 1;
    }
    else {
        return 0;
    }
}


int isArmstrong(int n) {
    int pow = 0;
    int r = 0;
    int sum = 0;
    int temp = n;
    while(temp>0) {
        pow += 1;
        temp /= 10;
    }

    temp = n;

    while(n>0) {
        r=n%10;
        int p = r;
        for(int i=1;i<pow;i++) {
            r *= p;
        }
        sum=sum+r;
        n=n/10;
    }
    if(temp==sum) {
        return 1;
    }
    else {
        return 0;
    }
}
