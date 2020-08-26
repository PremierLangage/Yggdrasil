extends = /model/checkbox.pl
extends = /model/math.pl

title = Equations quadratiques

before ==
var('x')
sol = []
choices = []
for i in range(3):
    a=randint(-5,5,[0])
    b,c = list_randint_norep(2,-5,5)
    if b**2-4*a*c<0:
        sol.append(i)
    else:
        sol.append(i)
    sides = randitem([[a*x**2+b*x+c,0],[a*x**2+b*x,-c],[a*x**2,-b*x-c],[a*x**2+c,-b*x]])
    rd.shuffle(sides)
    s = r"$$ %s $$" % latex(Eq(*sides))
    choices.append(s)
checkbox.setitems(choices)
checkbox.setsol_from_index(sol)
==

text ==
Sélectionner les équations qui n'ont pas de solution réelle dans la liste ci-dessous.
==

