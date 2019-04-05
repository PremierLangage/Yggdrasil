extends=/ComputerScience/python/plbank:/gift/template/match.pl


langage=python
tag=value|expression|operator

title= Appariement d'expressions et de  leur type

# si vous vouler spécifier les opérateurs autorisés
# TODO à vérifier 
# ops=['+','-','']
# DONE ce qui serais bien c'est que l'on tire des expressions au hazard qui ne donne pas les mêmes valeurs 
# si vous souhaiter utiliser aussi les opérateurs unaires - et ~
douops=True
# si vous souhaiter utiliser aussi des opérateurs de comparaison 
docops=True
# logiques 
dolops=True

dotype=True

type=direct

build=@ /concept/value/randomexpbuild.py

num=3

evaluator==

if (reponse == dic['pairs']): # comparaisons de deux dictionnaires
    return True, "Bien joué"
print("reponse",str(reponse))
print("dicpairs",str(dic['pairs']))
return False, "Mauvais matching"
==

