
extends=/template/default.pl

title = calcul numérique 


text ==
Ajouter le nombre de pied d'une chaise et d'une table. 
==

form =@/form/simplenumeric.html

evaluator ==


if response['txt_answer'] and int(response['txt_answer'])==8:
    form=""
    grade=(100," Bravo 4 pieds chacune")
else:
    grade=(0, "Ce n'est pas exact recommencez.")

==
