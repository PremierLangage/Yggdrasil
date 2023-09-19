

author= DR
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

tag=tpnote

title = Enumerer des entiers

text=
ftext==

Votre programme lit deux entiers *a*,*b*.
Si *a* est plus grand que *b* les deux entiers sont échangés.

Puis affiche pour chaque entier x de l'interval $%[a,b[%$ (fermé a gauche ouvert à droite, c-a-d, a dans l'ensemble et b ne l'est pas).  

Si x est divisible par {div1} affiche {txt1}   
si x est divisible par {div2} affiche {txt2}    
si x est divisible par  {div1} **et** {div2} affiche "KOuak"   
SINON affiche x !

==


before =

text = ftext.format(div1=7, div2=13, txt1="Fizz",txt2="Buzz")

==

