# author=OCE
# Heritage d'un type d'exercice 
# extends=/ComputerScience/python/template/loopsoluce.pl
# extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
# extends = /ComputerScience/python/AP1-1920/drafts/AntoineMeyer/templates/generic/generic.pl

#@ /ComputerScience/python/AP1-1920/templates/utils/pltest_doc.py
#@ /ComputerScience/python/AP1-1920/templates/utils/pltestgrader.py [grader.py]
#@ /ComputerScience/python/AP1-1920/templates/utils/feedback2.py
@ /ComputerScience/python/AP1-1920/templates/utils/template.html
@ /utils/sandboxio.py
@ /builder/none.py [builder.py]

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

#settings.allow_reroll=1

title = Suite arithmético-géométrique

text==  
En utilisant une boucle "for in range", écrire un programme permettant d'afficher le Nème entier de la suite arithmético géométrique croissante suivante : 

$%
\begin{cases}
a & > 1\\\
b & > 0\\\
u_0 & > a\\\
u_{n+1} & = a\times u_n + b
\end{cases}
%$

Vous utiliserez impérativement les variables a, b, N et Uo <br>
pour a et b vous prendrez les valeurs : 2 et 3 <br>
Pour N la valeur 100 et pour Uo la valeur 1
==

code== #|python|
# insérez votre code ici

# compléter les ??
print("le résultat est :",??)
==

taboo=while
# needed=for

grader==#|python|

from pltestgrader import *

student=pltestgrader.get_answers()['answer']
resultat=str((exec(student)))

print(resultat)
==











