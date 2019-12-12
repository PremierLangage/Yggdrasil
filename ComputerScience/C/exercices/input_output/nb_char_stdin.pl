# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Compter les caractères présents sur l'entrée standard

author=Nicolas Borie
title=Compter les caractères présents sur l'entrée standard
tag=input_output
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire un programme qui compte le nombre de caractères contenus sur l'entrée 
standard. Une fois la lecture terminée, votre programme devra écrire le nombre
de caractère lu tout seul sur une ligne.
    
==

editor.code==
#include ...

int main(int argc, char* argv[]){
  /** votre code ici... **/
}

==

solution==

#include <stdio.h>

int main(int argc, char* argv[]){
  char c;
  int nb=0;
  while((c = getchar()) != EOF)
    nb++;
  printf("%d\n", nb);
  return 0;
}

==

tests==
[["Simple test", "", "Ha\n(Denis Brogniart)\n"],
 ["Entrée vide", "", ""],
 ["Aléatoire", "", "".join([chr(random.randint(48, 126)) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([chr(random.randint(48, 126)) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([chr(random.randint(48, 126)) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([chr(random.randint(48, 126)) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([chr(random.randint(48, 126)) for i in range(random.randint(100,1000))])]]
==


