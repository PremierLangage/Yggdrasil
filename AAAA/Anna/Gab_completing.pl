extends = /gift/templates/qshortset.pl

title==
Q3
==

text==#|markdown|
Compléter le code suivant pour que la fonction puisse être opérationnelle

``

def factoriel(n):

    """

    Calcule le factoriel de l'entier n

    """

    if n<0:

        return None

    f=1

    for i in <b>_____</b>:

        f*=i+1 

    return f 

``

== 


choices==
=range(n) #Bravo
== 

doc == 
Exo ouvert où la réponse est rentré par l'élève et le résultat immédiatement obtenus. On peut noter selon un interval 
d'exactitude de la réponse. 
Après validation de la réponse : 
✓ -> réponse correcte 
x -> réponse fausse
==

