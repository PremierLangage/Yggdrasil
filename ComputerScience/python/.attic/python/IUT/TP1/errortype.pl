# OCE 10/09/2019 : KO

# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name= Erreurs de Type
title=  Erreur de Type
tag=TypeError  # N'oubliez pas de remplir ce champs svp
template=plbank:/python/0PLG/template

text==

#  Erreurs de Types

Les opérateur arithmétiques +,-,/,*,%,//,**, ne sont pas définis sur tout les types. 
Par exemple % qui est le module (reste de la division entière) n'a pas beaucoup de sens avec un float (un réel ).

De la même façon des opérations comme str+int sont possible mais refusées car elles sont souvant des erreurs. Donc pour être sur que le programmeur ne s'est pas trompé le ocmpilateur signal une erreur.

certaines opération ne font pas ce que l'on souhaite car le type des opérandes n'est pas celui que l'on attend.

Corrigez le code en changeant le type d'une des deux opérandes de façon à rendre homogène l'opération.

==


testcode==
print("""
 Nombre de jours dans une semaine 7
 La circonférence d'un cercle de rayon 7 est de 43.98226
 abc
""")
==
code==
print("")
print(" Nombre de jours dans une semaine "+7)


PI="3.14159"
print(" La circonférence d'un cercle de rayon 7 est de",2*PI*7)

s=int("abc") # êtes vous sur que abc est un entier ;)

print(s)

==

expectedoutput==
 Nombre de jours dans une semaine 7
 La circonférence d'un cercle de rayon 7 est de 43.98226
 abc
==

