# AAV : Déterminer si une proposition logique est vraie.
extends = /model/basic/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
numbers = set(range(1, 41))
even = set(range(2, 41, 2))
odd = numbers.difference(even)
case = randint(1, 4)
k = randint(3, 4)
if case == 1:
    A = sample(odd, k)
elif case == 2:
    A = sample(odd, k)
else:
    A = sample(numbers, k)
A = set(sorted(A))
items=[]
items.append("$$ \exists x \in A,\ x est impair $$")

div3 = set(range(3 ,41, 3))
div5 =set(range(5, 41, 5))
S={'pair':even,'impair':odd,'divisible par 3':div3,'divisible par 5':div5}

indsol = sample([0,1,2,3],k=randint(1,3))
op = ['et', 'et', 'ou', 'ou']
for i in range(4):
    p1=choice(['pair','impair'])
    p2=choice(['divisible par 3', 'divisible par 5'])
    if op[i]=='et':
        P=S[p1].intersection(S[p2])
    if op[i]=='ou':
        P=S[p1].union(S[p2])    
    if i in indsol:
        n=choice(list(P))
    else:
        n=choice(list(numbers.difference(P)))
    items.append(str(n)+" est "+p1+" "+op[i]+" "+p2)
==

question ==
$$ {{ A }} $$
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==
