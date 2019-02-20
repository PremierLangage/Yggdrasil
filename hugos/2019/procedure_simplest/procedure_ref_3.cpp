#include <iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void decrement(int &Y) {
    Y = Y - 1;
}

int main() {
    int X = I;
    int Z = -X;
    decrement(Z);
    cout << X << endl;
}


