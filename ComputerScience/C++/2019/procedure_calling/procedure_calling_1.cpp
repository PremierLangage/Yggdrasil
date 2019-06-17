#include <iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I1 = RANDOM_INT(2, 5);
CONST I2 = RANDOM_INT(2, 5);
CONST I3 = RANDOM_INT(2, 5);
/// END HIDDEN

void g(int &X) {
    X = X * I1;
}

void f(int X) {
    i = X PLUSOUMOINS I2;
    g(X);
}

int main() {
    int X = I3;
    f(X);
    cout << X << endl;
    return 0;
}
