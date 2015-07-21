#include <fib.h>
#include <stdio.h>
#include <stdlib.h>

int fib(int num){
    int a,b;
    a = 0;
    b = 1;
    printf("%d", b);
    for (int i = 0; i + a <= num; b = i){
        i = a + b;
        a = b;
        printf(", %d", i);
    }
    printf("\n");
    return 0;

}
