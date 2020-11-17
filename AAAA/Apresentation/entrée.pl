
extends = /model/mathinput2.pl


title= Balise de titre 

text==
Un exercice de saisie d'un calcul.


==


form ==
<hr>
{{ input1|component}}
Deuxièment
{{ input2|component}}
==

# Avant que ce soit présenté à l'élève 
before==

==

# évaluer la réponse 
evaluator==

grade=(100,"Bravo ")
==

