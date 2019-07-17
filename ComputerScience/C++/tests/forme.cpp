#include <iostream>
#include <string.h>
using namespace std;

/** Infrastructure minimale de test **/
#define ASSERT(test) if (!(test)) cout << "Test failed in file " << __FILE__ \
				       << " line " << __LINE__ << ": " #test << endl


/** La forme d'un individu
 *  @param repos  nbr de battement cardiaque à la minute au repos
 *  @param effort nbr de battement cardiaque à la minute après l'effort
 *  @param recup  nbr de battement cardiaque à la minute après une minute de récupération
 *  @return une chaîne de caractère décrivant la forme
 **/
string forme(int repos, int effort, int recup) {
  /// BEGIN SOLUTION
  float cond;
  cond = 0.1 * (repos + effort + recup - 200);
  if (cond <= 0) return("excellente");
  else if (cond < 5) return("tres bonne");
  else if (cond < 10) return("bonne");
  else if (cond < 15) return("moyenne");
  else return("faible");
  /// END SOLUTION
}


void formeTest(void) {
  ASSERT( forme(60,80,60) == "excellente" );
  /// BEGIN HIDDEN
  ASSERT( forme(70,90,80) == "tres bonne" );
  ASSERT( forme(80,120,80) == "bonne" );
  ASSERT( forme(80,150,100) == "moyenne" );
  ASSERT( forme(90,150,130) == "faible" );
  /// END HIDDEN
}

/// BEGIN HIDDEN
int main() {
  formeTest();
}
/// END HIDDEN

