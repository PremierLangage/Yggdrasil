#include <iostream>

using namespace std;


/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void change(int &Y) {
    Y = Y PLUSOUMOINS 1;
}

int main() {
    int X = I;
    int Z = -X;
    change(Z);
    cout << X << endl;
}


