extends = /Mathematics/template/mathbasic.pl

title = Matrice sous forme échelonnée

lang = fr


before ==
from math import ceil

# randint(4,7) est un entier aléatoire choisi parmi 4, 5, 6, 7
n = randint(4,7)
m = randint(4,7)

r = randint(ceil(min(n,m)/2), min(n,m))
t = randint(0,2)

# range(n) = [0,1,.., n-1]. sample(liste, r) renvoie une liste de 'r' éléments choisis au pif dans la liste, et pas dans l'ordre, sans répétition.
J = rd.sample(range(n),r)
J.sort()

# une matrice de zéros
A = sp.zeros(m,n)

# Attention: les indices de matrices commencent à zéro.
for i in range(r) :
    A[i,J[i]] = randint(0,3)+1
    if J[i] < n-1:
        for j in range(J[i]+1, n) : 
            A[i,j] = randint(0,5) - 2

if (t == 0) or (t == 1 and r == 1) or (t == 2 and r == m): bonne_reponse = 'oui'
elif (t == 1) and (r > 1) :
    k = randint(1,r-1)
    for j in range(J[k]) : 
        A[k-1,j] = 0
    bonne_reponse = 'non'
elif (t == 2) and (r < m) :
    k = randint(r+1,m)
    A[k-1,J[r-1]] = randint(0,3) + 1
    bonne_reponse = 'non'

latexA=latex(A)
==

text ==
On considère la matrice $$ A= {{latexA}}. $$ Est-elle échelonnée ?
==

form ==
<div>
<select id = 'form_1'>
	<option value='oui'> Oui </option>
	<option value='non'> Non </option>
</select>
</div>
==

evaluator ==
if answer['1'] == bonne_reponse : 
    score = 100
    numerror = 0
    texterror = ""
else : 
    score = 0
    numerror = 1
    texterror = ""

feedback=fb.msg_analysis(score,texterror,lang)
==


