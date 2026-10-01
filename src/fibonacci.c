#include <stdio.h>

static unsigned fibonacci(unsigned n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(void) {
    for (unsigned n = 0; n < 10; n++) {
        printf("%s%u", n ? " " : "", fibonacci(n));
    }
    putchar('\n');
    return 0;
}
