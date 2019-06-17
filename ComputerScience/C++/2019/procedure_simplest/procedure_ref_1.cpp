#include <iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void change(int &X) {
    X = X PLUSOUMOINS 1;
}

int main() {
    int Y = I;
    change(Y);
    cout << Y << endl;
}


