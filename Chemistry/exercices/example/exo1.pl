extends=/Chemistry/templates/template.pl

@data.csv

path=data.csv
title=Chimie

text==
Donnez les produits de la réaction suivante : <i>{{reaction|safe}}</i>
==


evaluator==#|py|
A = eval(response['answer'])
B = []
i = 1
while True:
    k = 'produit'+str(i)
    if k in exercice:
        v = exercice[k]
        if v:
            B.append(v)
    else:
        break
    i += 1
if A == B:
    grade=(100, 'Bonne réponse')
else:
    grade=(0, 'Vous avez répondu {0}, la bonne réponse était {1}'.format(A, B))
==

#file:///Users/mamadou/Downloads/JSME_2017-02-26/jme_examples/jme_example1.html
