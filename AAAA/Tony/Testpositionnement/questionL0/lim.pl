#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat =
#Note pour David : ce serait bien de pouvoir dupliquer un exercice dans un même dossier

extends= /model/basic/checkbox_rw.pl

 
question==
Parmi ces limites, lesquelles valent $!+\infty!$? 
==
 

right== 

$!\lim\limits_{x\rightarrow 2} \frac{1}{(x-2)^2}!$
$!\lim\limits_{x\rightarrow +\infty} e^{-x}+\ln(x)+x-2!$ 

==

wrong==
$!\lim\limits_{x\rightarrow 0} \frac{1}{x}!$
$!\lim\limits_{x\rightarrow +\infty} \frac{x^2+2}{2x-x^2}!$ 

==





