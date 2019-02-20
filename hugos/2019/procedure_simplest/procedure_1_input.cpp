#include<iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void saisie(int Y) {
    int Z;
    cin >> Z;
    Y = Y PLUSOUMOINS Z;
    cout << Y;
}

int main() {
    int X = I;
    saisie(X);
    return 0;
}
