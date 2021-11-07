#include <stdio.h>

void swap(char arr[], int a, int b);
int minIndex(char arr[], int size, int start);

int main(int argc, char const *argv[])
{
    char arr[] = "gajbhuytrewqzxcfdpolkmnsiv";
    int size = sizeof(arr) - 1;

    for (int i = 0; i < size; ++i){
        int index = minIndex(arr, size, i);
        swap(arr, i, index);
    }

    for (int i = 0; i < size; ++i){
        printf("%c", arr[i]);
    }
    printf("\n");

    return 0;
}

void swap(char arr[], int a, int b){
    char temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
}

int minIndex(char arr[], int size, int start){
    char min = arr[start];
    int index = start;
    for (int i = start + 1; i < size; ++i){
        if (arr[i] < min){
            min = arr[i];
            index = i;
        }
    }

    return index;
}
