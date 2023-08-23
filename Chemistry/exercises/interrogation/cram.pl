extends=/Chemistry/templates/molecules/template.pl

@data.csv

path=data.csv

title=Représentation de CRAM 
text==
Donnez les produits de la réaction du <i>{{nom|safe}}</i> dans les conditions suivantes : <i>{{reaction|safe}}</i>
==
evaluator==
answer = eval(response['answer'])
if answer == expected:
    grade=(100, 'Bonne réponse')
else:
    grade=(0, 'Vous avez répondu {0}, la bonne réponse était {1}'.format(answer, expected))
==






