#include <iostream>
using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
CONST J = RANDOM_INT(2, 10);
/// END HIDDEN

int f(int n) {
    return n * n;
}

int main() {
    int a = I;
    a PLUSOUMOINS J;
    cout << f(a) << endl;
}
