#include "NumClass.h"
#include <stdio.h>

int isPalindrome(int n) {
    int isPalindrome2(int n, int rev,int org, int r);
    return isPalindrome2(n, 0, n, 0);
}
int isPalindrome2(int n, int rev, int org, int r) {
    if (n<=0) {
        if(org==rev){
            return 1;
        }
        else {
            return 0;
        }
    }
    r = n%10;
    rev = rev*10+r;
    n = n/10;
    return isPalindrome2(n,rev,org,r);
}


int isArmstrong(int n) {
    int isArmstrong2(int n, int pow, int r, int sum, int temp);
    int pow = 0;
    int temp = n;
    while(temp>0) {
        pow += 1;
        temp /= 10;
    }
    temp = n;
    return isArmstrong2(n,pow,0,0,temp);
}
int isArmstrong2(int n, int pow, int r, int sum, int temp) {
    if(n<=0) {
        if(temp==sum) {
            return 1;
        }
        else {
            return 0;
        }
    }
    r=n%10;
    int p = r;
    for(int i=1;i<pow;i++) {
        r *= p;
    }
    sum=sum+r;
    n=n/10;
    return isArmstrong2(n,pow,r,sum,temp);
}
