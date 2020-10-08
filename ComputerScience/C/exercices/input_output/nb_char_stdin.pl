#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Compter les caractères présents sur l'entrée standard
tag=input_output

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
 ["Aléatoire", "", "".join([random.choice(['', '\n', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([random.choice(['', '\n', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([random.choice(['', '\n', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']) for i in range(random.randint(100,1000))])],
 ["Aléatoire", "", "".join([random.choice(['', '\n', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']) for i in range(random.randint(100,1000))])] ]
==




