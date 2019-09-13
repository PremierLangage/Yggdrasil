# Boris Jabot 10/09/2019 KO
extends=/ComputerScience/python/template/soluce.pl

@ /utils/sandboxio.py

@ /builder/before.py [builder.py]



doc==

L'objectif de l'exercice est de proposer des exemple de codes aléatoire avec une erreur dedans.

1) Le nom de variable inconnu.
2) appel de fonction sans paranthèse : 
- print 
- input 
3) Erreur sur la ligne au dessus, 
3.1) paranthèse manquante 
3.2) fin de chaine manquante
3.3) pas de : après else for etc.
4) Erreur sur l'utilisation de " et ' 
4.1) Une chaine pas entre quote 
4.2) Un entier entre quote 
4.3) Une quote au milieu d'une chaine entre quote ou guillemet et guillemets.
==
@ corrigemoialea.py 

before== #|python|
import corrigemoialea as ca 

component.code, soluce, compilehelp = ca.createexo()

text += "bibi" 

==

component =: CodeEditor

component.code ==
import os
==
#component.theme = white
component.language = python


form==
{{component|component }}
==

evaluator==
grade = (100,str( component.code))
==



title== #|html|
Corrige Moi !
==

text== #|html|
Le code suivant créer un erreur de compilation,
corrigez celle-ci. 
==
 

