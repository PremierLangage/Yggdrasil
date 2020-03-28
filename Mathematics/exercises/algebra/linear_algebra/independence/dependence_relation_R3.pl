extends = /model/mathinput.pl

title = Relation de dépendance entre vecteurs $! \mathbb{R}^4 !$

nbstep % 5

before ==

A = rand_int_matrix_givenrank(3, 4, 3, magnitude=1)
u = str(tuple(A.row(0)))
v = str(tuple(A.row(1)))
w = str(tuple(A.row(2)))
    family.append(', '.join([str(tuple(A.row(i))) for i in range(n)]))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^4 !$. On considère les vecteurs :
$$ u = {{u}}, v = {{v}} et w = {{w}}.$$
==

formstep ==
{{ radios[step]|component }}
==

evaluatorstep ==
score = radios[step].eval()
==

