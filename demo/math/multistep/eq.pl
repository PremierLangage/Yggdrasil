extends = /model/math/multistep.pl

before == #|python|
x = Symbol('x')
a = randint(-4, 4, [0])
b = randint(-4, 4, [0])
c = randint(-4, 4, [0])
P = a*x**2+b*x+c
#lstsol = list(solveset(P,x,domain=S.Reals))
sequence = [StepMath(), StepRadio()]
disc = b**2-4*a*c

sequence[0].question = "Calculer le discriminant de ce trinôme."
sequence[0].input.sol = disc

if disc > 0:
    indsol = 2
elif disc < 0:
    indsol = 0
else:
    indsol = 1

sequence[1].input.fill(["Aucune racine réelle", "Une racine réelle double.", "Deux racines réelles distinctes"], indsol, False)
==

intro ==
On considère le trinôme suivant :
$$ {{ P|latex }}.$$
==

