
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
@ func.csv
@ getcsv.py



# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = String functions 
text==  
Ecrire une fonction **{{objectif}}** qui vérifie la description suivante : 

{{description}}

==
before==
import getcsv
l=getcsv.selectionfromcsv("func.csv")
value=l[0]
description=value['description']
objectif=value['objectif']
soluce=value['soluce']
taboo=value['taboo']


==








