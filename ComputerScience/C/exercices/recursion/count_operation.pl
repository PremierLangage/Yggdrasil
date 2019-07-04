# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Comptez un nombre d'opéération

author=Nicolas Borie
title=Comptez combien d'addition seront opérée...
tag=function|recursion|complexity

text==
Voici un programme C qui fait un appel à une fonction récursive simple. Comptez combien 
d'additions seront opérée par la machine durant l'exécution du programme


    int bizarre(int n){
      if (n == 0)
        return 2;
      if (n == 1)
        return 3;
      return bizarre(n-1) + bizarre(n-2) + 1;
    }


==

form==
<input type="text" />
==

grader==
print(1)
==

