# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Conversion de température

text==  

Écrire une fonction "conv()" qui reçoit deux paramètres, une température "t" et un entier "n", et qui retourne la conversion 
Celsius -> Fahrenheit (n= 1), ou Fahrenheit -> Celsius(n= 2).<br>
Rappel :<br
$%
\begin{cases}
Tf & = 32 +1.8 * Tc\\\
\end{cases}
%$
==

pltest0==
>>> factoriel(3)==6 and combinaison(3,2)==3 and coefficients_binome(2)=="1 2 1"
True
==
pltest1==
#negatif
>>> coefficients_binome(-9)
'non défini'
==

pltest2==
>>> coefficients_binome(5)
'1 5 10 10 5 1'
==





