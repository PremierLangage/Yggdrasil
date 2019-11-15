

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =liste vers mot
text== 
La méthode 'join' reçoit une chaine de caractère *separateur* et un itérable (ici une liste) formé de chaines de caratères. Elle renvoie une nouvelle chaine formée des chaines de caractères de la liste séparées per la chaine *separateur*.
<br>
Exemples:<br>
"3".join(['toto','titi','tata']) renvoie 'toto3titi3tata'<br>
"TTT".join(["r","y","gh"]) renvoie 'rTTTyTTTgh'<br>
Ecrire une fonction relie qui simule ce fontionnement.
==
before=
