#include<iostream>

using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void saisie(int &a) {
    int b;
    cin >> b;
    a = a + b;
}

int main() {
    int a = I;
    saisie(a);
    cout << a;
    return 0;
}
