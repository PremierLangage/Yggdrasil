
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =coefficient du binome
text==
En utilisant la définition :
$%\binom{n}{0}=1%$ <br>
$%\binom{n}{n}=1%$ <br>
$%\binom{n}{p}=\binom{n-1}{p}+binom{n-1}{p-1}1%$ pour $%0 \lt p \lt n%$ <br>
écrire une fonction recursive puissance(a,n) qui renvoie la valeur $%a^n%$
En utilisant la définition <br>
$%a^0=1%$<br>
$%a^n=(a^\frac{n}{2})^2%$ si n est pair<br>
$%a^n=a*(a^\frac{n}{2})^2%$ si n est impair<br>
ecrire une fonction recursive puissancer(a,n) qui renvoie la valeur $%a^n %$
==

before==
from random import *


def binom
==
