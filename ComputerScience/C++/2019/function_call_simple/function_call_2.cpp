#include <iostream>
using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

int f(int n) {
    return 2 * n - 1;
}

int main() {
    int a = I;
    f(a);
    cout << a << endl;
}
