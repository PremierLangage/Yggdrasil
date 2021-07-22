title = "Addition pour les nuls"

#Modèle prédéfini (hérite du modèle numeric, on hérite des clés et valeurs du modèle)
extends = /model/basic/numeric.pl

question ==  
Calculer {{A}} + {{P}}

==
 

#Variables prédéfinies de la question 
before ==

A = randint(1,5)*10
P = choice([1,5,4,6,5]) 
sol = A+P
==

#f pour mettre une variable dans le résultat. ans est la réponse
evaluator ==

if not isinstance(ans,int):
    score =-1
    feedback = "Apprend ton cours la réponse est un entier"

if ans != sol :
    score =0
    feedback = f"T es nul c'est {sol}"
else :
    score = 100
    feedback = "Bravo biloute"

==


#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat =
#Note pour David : ce serait bien de pouvoir dupliquer un exercice dans un même dossier

extends= /model/basic/checkbox_rw.pl


title= Savoir reconnaitre les caractéristiques d'une ED (linéarité, ordre…) : linéarité

text==
Parmi ces équations différentielles, lesquelles sont linéaires d'ordre 1 homogène?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!y'-xy = 0!$
$!y'=-2y!$
$!y'-\cos(x)y = 0!$
$!y'-x^2y = 0!$
$!2y' = \sin(x)y!$
$!y'+e^xy = 0!$
$!y'-3y = 0!$
$!y'-5xy = 0!$
$!y'-3xy = 0!$
==

wrong==
$!y'-y^2 = 0!$
$!y' = \cos(y)!$
$!y' = y^3!$
$!y'-xy = \cos(x)!$
$!y'-3y = x^2 !$
$!y''-y = 0!$
$!y''+2y'-y = 0!$
$!y''-y = 3!$
$!y''+xy'-y = 0!$
$!y'-3y = e^x !$
$!y'-xy = \sin(x) !$
==




