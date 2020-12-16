extends = /model/basic/radio.pl

title = Relation de divisibilité

before ==
if randint(0,1)==0:
    while True:
        a,b=list_randint_norep(2,2,30)
        if (a%b==0 or b%a==0):
            break
    if a%b==0:
        numsol=0
    else:
        numsol=1
else:
    while True:
        a,b=list_randint_norep(2,2,30)
        if (a%b!=0 and b%a!=0):
            break
    numsol=2

choices = [f"{b}  \ll {a}",
            f"{a}  \ll {b}",
            f"{a} et {b} ne sont pas comparables"]
==

text == 
Soit $% \ll %$ la relation d'ordre sur $% \mathbb{N}^* %$ définie par : $% p \ll q %$ si $%p%$ divise $%q%$.

Comment se comparent les entiers $%{{a}}%$ et $%{{b}}%$ par rapport à cette relation d'ordre.
==