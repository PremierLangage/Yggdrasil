extends = /template/mathradio.pl

title = Relation de divisibilité

lang = fr

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
==

text == 
Soit $% \ll %$ la relation d'ordre sur $% \mathbb{N}^* %$ définie par : $% p \ll q %$ si $%p%$ divise $%q%$.

Comment se comparent les entiers $%{{a}}%$ et $%{{b}}%$ par rapport à cette relation d'ordre.
==

form ==
{{input_1}}
==

input.1.type = radio

input.1.shuffle = no

input.1.choices ==
$% {{b}}  \ll {{a}} %$ 
$% {{a}}  \ll {{b}} %$ 
$%{{a}}%$ et $%{{b}}%$ ne sont pas comparables
==

input.1.numsol = {{numsol}}

evaluator ==
if answer['1']==numsol:
    score=100
else:
    score=0
feedback = answer
==





