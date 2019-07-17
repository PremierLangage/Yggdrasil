#include <iostream>
using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
CONST J = RANDOM_INT(2, 10);
/// END HIDDEN

void f(int x, int y) {
    x = x PLUSOUMOINS 1;
    y = y PLUSOUMOINS 2;
}

int main() {
    int x, y;
    x = I;
    y = J;
    f(y, x);
    cout << x << ", " << y << endl;
}
