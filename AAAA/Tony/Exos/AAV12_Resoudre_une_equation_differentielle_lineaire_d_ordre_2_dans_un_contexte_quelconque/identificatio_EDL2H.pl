#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat =
#Note pour David : ce serait bien de pouvoir dupliquer un exercice dans un même dossier

extends= /model/basic/checkbox_rw.pl


title= Savoir reconnaitre les caractéristiques d'une ED (linéarité, ordre…) : linéarité

text==
Parmi ces équations différentielles, lesquelles sont linéaires d'ordre 2 homogène?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!y''-y = 0!$
$!y''+2y'-y = 0!$
$!y''+ sin(x) y = 0!$
$!y''+xy'-y = 0!$
$!cos(x) y''+y' + 3 y = 0!$
$!2 y''+ e^x y' +  y = 0!$
$!2 y''- 5y' + 2 y = 0!$

==

wrong==
$!y'-xy = 0!$
$!y'=-2y!$
$!y'-\cos(x)y = 0!$
$!y'-x^2y = 0!$
$!2y' = \sin(x)y!$
$!y'+e^xy = 0!$
$!y'-3y = 0!$
$!y'-5xy = 0!$
$!y'-3xy = 0!$
$!y'-y^2 = 0!$
$!y' = \cos(y)!$
$!y' = y^3!$
$!y'-xy = \cos(x)!$
$!y'-3y = x^2 !$
$!y''-y = 0!$
$!y''+2y'-y -2 = 0!$
$!y''-y = 3!$
$!y''+xy'-y = 4!$
$!y'-3y = e^x !$
$!y'-xy = \sin(x) !$
==




