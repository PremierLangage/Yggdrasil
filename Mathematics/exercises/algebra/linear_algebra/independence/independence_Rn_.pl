extends = /model/mathmultistep.pl

title = Familles libres dans $! \mathbb{R}^3 !$ et $! \mathbb{R}^4 !$

before ==
dim = []
family = []
radios = []
a = I
for i in range(4):
    n = 2
    case = 0
    if case == 0:
        A = rand_int_matrix_givenrank(2, 4, 2, magnitude=2)
    else:
        A = rand_int_matrix_givenrank(3, 4, 2, magnitude=1)
    radios.append(CustomRadio())
    radios[i].setitems(["Oui","Non"])
    radios[i].setsol_from_index(case)

dim.append(n)
family.append(', '.join([str(tuple(A.row(i))) for i in range(n)]))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$. La famille de vecteurs suivante est-elle libre ?

$$ \mathcal{F} = \\{ {{ family[step] }} \\}.$$
==

form ==
{{ radios[step]|component }}
==

evaluatorstep ==
score = radios[step].eval()
==

