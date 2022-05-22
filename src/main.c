
#include "nim/interop.h"
#include <stdio.h>

int main(int argc, const char* argv[]) {
    NimMain();
    for (int f = 0; f < 10; f++) {
        printf("Fib of %d is %d\n", f, fib(f));
    }

    return 0;
}