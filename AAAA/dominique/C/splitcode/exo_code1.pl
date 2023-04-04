


#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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


extends = ./docodesplit.pl

extends=/ComputerScience/C/template/std_progC.pl



author=Dominique Revuz
title=Ajout dans un tableau dynamique
tag=allocation|Ensembles

editor.height=300px

text==
{enonce}
{ type(editor}
==

before==


#editor.code==#|c|

==


debug==
/*
ENSEMBLE *alloueTabDyn(){
    ENSEMBLE *s= malloc(sizeof(ENSEMBLE));
    s->tab=malloc( BLOC*sizeof(int));
    return s;
}
int resize(ENSEMBLE *e){
    if (e->taille == e->max) return (int) s->tab = realloc(s->tab,s->max+=BLOC);
    if (e->taille +2*BLOC <  e->max) return (int) s->tab = realloc(s->tab,s->max-=BLOC);
    return 0;
}

*/
==

@ code1.c [code.c]


checks_args_stdin==#|python|
	[["Arbre feuille","","4"],
	 ["arbre à 3 mots","","12  5 2"],
   ["arbre à N mots","","15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"],
   
     ["Arbre aléatoire II", ""," ".join([ str(randint(1,100)) for i in range(10) ])]
]
==


