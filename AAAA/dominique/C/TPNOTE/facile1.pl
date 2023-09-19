

author= DR
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

tag=tpnote

title = Enumerer des entiers

text=
ftext==


Votre programme lit deux entiers *a*,*b*.
Si *a* est plus grand que *b* les deux entiers sont échangés.

Puis affiche pour chaque entier x de l'interval $%[a,b[%$ (fermé a gauche ouvert à droite, c-a-d, a dans l'ensemble et b ne l'est pas).  

Sur une ligne pour chaque x: 
Si x est divisible par {div1} affiche {txt1}   
si x est divisible par {div2} affiche {txt2}    
si x est divisible par  {div1} **et** {div2} affiche "KOuak"   
SINON affiche x !

==

fcode==

print('{txt1}')
print('{txt2}')

==


before ==
div1=random.choice([3, 5, 7, 11,5])
div2=random.choice([4, 2, 8, 4,2])



text = ftext.format(div1=7, div2=13, txt1="Fizz",txt2="Buzz")
code= fcode.format(txt1="Fizz",txt2="Buzz")
==

soluce==
div1=7
div2=13
txt1=
a=int(input())
b=int(input())
if a> b:
    a,b = b,a

for i in range(a,b):
    if i%


