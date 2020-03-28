extends = /model/mathmultistep.pl

title = Familles libres dans les polynômes

nbstep % 5

before ==
from customradio import CustomRadio

dim = []
family = []
radios = []
var('X')
for i in range(nbstep):
    case = rd.randint(0,1)
    if case == 0:
        n, m, r, k = rd.choice([(2, 4, 2, 2), (2, 3, 2, 2), (3, 4, 3, 1), (3, 3, 3, 1)])    
    else:
        n, m, r, k = rd.choice([(2, 4, 1, 2), (2, 3, 1, 2), (3, 4, 2, 1), (3, 3, 2, 1)])
    A = rand_int_matrix_givenrank(n, m, r, magnitude=k)
    radios.append(CustomRadio())
    radios[i].setitems(["Oui","Non"])
    radios[i].setsol_from_index(case)
    dim.append(m)
    family.append(', '.join([latex(Poly(tuple(A.row(i)),X)) for i in range(n)]))
==

textstep ==
**Question {{step + 1}}.** On se place dans le $!\mathbb{R}!$-espace vectoriel des polynômes réels. La famille de polynômes suivante est-elle libre ?

$$ \mathcal{F} = \\{ {{ family[step] }} \\}.$$
==

formstep ==
{{ radios[step]|component }}
==

evaluatorstep ==
score = radios[step].eval()
==

