#include "NumClass.h"
#include <stdio.h>

int factorial(int n);

int isStrong(int n) {
    int sum = 0;
    int num = n;
    while(num > 0) {
        sum = sum + factorial(num%10);
        num /= 10;
    }
    if (sum == n) {
        return 1;
    }
    else {
        return 0;
    }
}

int isPrime(int n) {
    if (n <= 1) {
        return 0;
    }
    for (int i = 2; i < n; i++){
        if (n % i == 0) {
            return 0;
        }
    }
        return 1;
    }

int factorial(int n) {
    int times = n;
    for(int i = times ; i > 2 ; i--) {
        n = n*(i-1);
    }
    return n;
}
