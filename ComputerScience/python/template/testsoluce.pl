
title= Test du template/soluce.pl

# ceci est un exercice pour les tests qui permet de verifier le template soluce.pl
extends=/ComputerScience/python/template/soluce.pl


text==
ecrire un script qui lit une string 
et qui recopie  la string sur la sortie standard 

le test triche cela ne fonctionne que pour la chaine success 
pour la chainei cela fait une failure et pour error cela fait une erreur  
==


code==
x=input()
if x=="success":
   print(x)
if x=="failure":
   print("NON c'est pas ca")
if x=="error":
   print(1/0)
==

soluce==
# ne pas modifier ce code il permet le test
x=input()
print(x)
==

plsoluce==
un test quoi doit marche : |success
ce test produit une failure|failure
ce test produit une erreur |error
==

Xplsoluce==
un success ? |success
un test quoi doit marcher : |success
un  autre test quoi doit marcher : |success
==

