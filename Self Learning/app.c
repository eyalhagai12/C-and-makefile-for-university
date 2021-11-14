#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    printf("Enter array size: ");
    size_t size;
    scanf("%ld", &size);
    printf("\narray size: %ld\n", size);

    int* array = (int*)malloc(size);

    for (int i = 0; i < size; ++i){
        array[i] = i;
    }

    for (int i = 0; i < size; ++i){
        printf("%d, ", array[i]);
    }

    printf("\n");

}



