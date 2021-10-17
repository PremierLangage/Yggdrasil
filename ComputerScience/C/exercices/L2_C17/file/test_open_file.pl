#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC17_clang.pl

title=Tester des ouvertures de fichiers

tag=fichier|programme|ouverture|retour

author=Nicolas Borie

editor.height=300px

@f1.txt
@f2.txt
@f3.txt
@f4.txt
@f5.txt
@f6.txt
@titi
@toto

text==#|markdown|
Écrire un programme C dont les arguments seront des noms de fichiers potentiellement
situés dans le répertoire courant de travail. le but de cet exercice est de tenter 
d'ouvrir ces fichiers en mode lecture et de faire un affichage, fichier par fichier, 
pour rendre compte de la possibilité de les ouvrir ou pas.


    platus@sacapus:~$ ./a.out ficher1 fichier2 fichier3 fichier4
    Le fichier ficher1 a bien été ouvert.
    Le fichier ficher2 a bien été ouvert.
    L'ouverture du fichier ficher3 a échouée.
    Le fichier ficher4 a bien été ouvert.


N'oubliez pas de fermer les fichiers lorsque l'ouverture a bien été effective.


==

code_before==#|c|
==

editor.code==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  // Votre code ici 
}
==

solution==#|c|
#include <stdio.h>

int main(int argc, char* argv[]){
  FILE* f;
  int i;

  for (i=1 ; i<argc ; i++){
    f = fopen(argv[i], "r");
    if (f == NULL){
      printf("L'ouverture du fichier %s a échouée.\n", argv[i]);
    }
    else{
      fclose(f);
      printf("Le fichier %s a bien été ouvert.\n", argv[i]);
    }
  }
  return 0;
}
==

code_after==#|c|

==

checks_args_stdin==#|python|
[ ["Sans argument", [], ""],
  ["Un fichier ouvrable", ["toto"], ""],
  ["Un fichier qui n'existe pas", ["tata"], ""],
  ["Test aléatoire 1", sample(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt", "titi", "toto", "tata", "f6.txt", "f7.txt", "perdu", "JACK", "cpuinfo"], randint(1, 7)), ""],
  ["Test aléatoire 2", sample(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt", "titi", "toto", "tata", "f6.txt", "f7.txt", "perdu", "pouet", "plop"], randint(1, 7)), ""],
  ["Test aléatoire 3", sample(["f1.txt", "f2.txt", "f3.txt", "f4.txt", "f5.txt", "titi", "toto", "tata", "f6.txt", "f7.txt", "perdu", "f8.txt", "f11.txt", "nada", "nichts"], randint(1, 7)), ""], ]
==

astuces==#|python|
[
  { "content": """Il faut faire une boucle sur les arguments de votre programme et essayer d'ouvrir avec `fopen` en mode lecture `"r"` chacun des noms de fichiers."""},
  { "content": """Attention, il ne faut pas considérer `argv[0]`. Losque les fichiers sont bien ouverts, il ne faut pas oublier de les `fclose`."""},
  { "content": """Le point important de cet exercice est juste de bien regarder si chacun des `FILE*` retourner par `fopen` sont nuls ou pas. Si `fopen` retourne `NULL`, on `printf` la phrase d'échec sinon on envoie celle du succès."""}
]
==



