

author= DR
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

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
import random
div1=random.choice([3, 5, 7, 11,5])
div2=random.choice([4, 2, 8, 4,2])

txt1 = random.choice(["Fizz","Cola","Ice","Bap","Tap","You!"])
txt2= random.choice(["Tip","Shou","Wham","Bang","Zip"])

text = ftext.format(div1=div1, div2=div2, txt1=txt1,txt2=txt2)
code= fcode.format(div1=div1, div2=div2, txt1=txt1,txt2=txt2)

text = text + "<pre>" + fsoluce.format(div1=div1, div2=div2, txt1=txt1,txt2=txt2)+"</pre>"

soluce = fsoluce.format(div1=div1, div2=div2, txt1=txt1,txt2=txt2)

a=random.randint(1,10)
b= random.randint(a+div2+div1,a+(div2+div1)*2)


for i in range(5):
    a=random.randint(i+2,5*(i+1))
    b= random.randint(a+div2+div1,a+(div2+div1)*2*(i+1))
    globals()[f"mplsoluce{i}"]= f""" test N°{i+1}
    {a}
    {b}
    """
==


fsoluce==
div1={div1}
div2={div2}
txt1='{txt1}'
txt2='{txt2}'
a=int(input())
b=int(input())
if a> b:
    a,b = b,a

for i in range(a,b):
    if i% {div1} ==0 and i% {div2} == 0:
        print("KOuak")
    elif i% {div1} ==0 :
        print("{txt1}")
    elif i% {div2} ==0 :
        print("{txt2}")   
    else:
        print(i)
==


