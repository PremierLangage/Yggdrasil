extends = /model/basic/checkbox.pl

title = Déterminer si une proposition est vraie

shuffle % true

before ==
numbers=set(range(1,41))
even=set(range(2,41,2))
odd=numbers.difference(even)
div3=set(range(3,41,3))
div5=set(range(5,41,5))
S={'pair':even,'impair':odd,'divisible par 3':div3,'divisible par 5':div5}
choices=[]
indsol = list_randint_norep(randint(1,3),0,3)
op=['et','et','ou','ou']
for i in range(4):
    p1=randitem(['pair','impair'])
    p2=randitem(['divisible par 3', 'divisible par 5'])
    if op[i]=='et':
        P=S[p1].intersection(S[p2])
    if op[i]=='ou':
        P=S[p1].union(S[p2])    
    if i in indsol:
        n=randitem(list(P))
    else:
        n=randitem(list(numbers.difference(P)))
    choices.append(str(n)+" est "+p1+" "+op[i]+" "+p2)
==

question ==
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

