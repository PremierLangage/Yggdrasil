#include <iostream>
#include <vector>
using namespace std;

/// BEGIN HIDDEN
#include "randomization.h"
CONST V = RANDOM_VECTOR(5, RANDOM_INT, 2, 10);
CONST I = RANDOM_INT(2, 10);
/// END HIDDEN

void blourg(vector<int> t, int v, int &i, bool &b) {
    i = -1;
    b = false;
    for ( int j = 0; j < t.size(); j++) {
        if (t[j]  == v) {
            i = j;
            b = true;
        }
    }
}


int main() {
    bool  toto;
    vector<int> tab = V;
    int s = 0;
    blourg(tab, I, s, toto);
    if (toto) cout << s << endl;
    else  cout << "blourg" << endl;
}
