#include <iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void decrement(int &X) {
    X = X - 1;
}

int main() {
    int Y = I;
    decrement(Y);
    cout << Y << endl;
}


