extends = /model/basic/checkbox_rw.pl

question ==
Le fichier  suivant contient potentiellement des erreurs de syntaxes. 
		
```C
#include <stdio.h>

int main(void) {
    int i;
    for(i=0; i<3; i+=1)
       printf("%d",i);
    return 0
}
```

Combien y en a t-il ?
==

right ==
0
0
==

wrong ==
1
2
3
==

nbitems = 4
minright = 1
maxright = 1