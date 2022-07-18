#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat =
#Note pour David : ce serait bien de pouvoir dupliquer un exercice dans un même dossier

extends= /model/basic/checkbox_rw.pl


title= Savoir reconnaitre les caractéristiques d'une ED (linéarité, ordre…) : ordre

text==
Parmi ces équations différentielles, lesquelles sont d'ordre 2 ?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!y''-y = 0!$
$!y''+2y'-y = 0!$
$!y''-y = 3!$
$!y''+xy'-y = 0!$
$! y''+cos(y)=0!$
$!y'' = y^3 !$
$!(y'')^2 + y= e^x !$
$!y''+2y'+y = 0!$
$!5y''-7y'+4y = 0!$
$!2y''-3y'+2y = cos(x)!$
$!5y''-2y'+4y = e^x!$

==

wrong==
$!(y')^2-xy = 0!$
$!y'=-2y!$
$!(y')^3-\cos(x)y = 0!$
$!y'-x^2y = 0!$
$!2y' = \sin(x)y!$
$!\cos(y')+e^xy = 0!$
$!y'-3y = 0!$
$!y'-5xy = 0!$
$!\sqrt{y'}-3xy = 0!$
$!y'-xy = \cos(x)!$
$!y'-3y = x^2 !$
$!(y')^4-3y = e^x !$
$!y'-xy = \sin(x) !$
$!y'-y^2 = 0!$
$!y' = \cos(y)!$
$!y' = y^3!$
$!y'+ \sqrt{y} = 2!$
$!y^{(3)}=3y !$
$!y^{(7)}-xy = \cos(x) !$
$!y'''-y^2 = 0!$

==




