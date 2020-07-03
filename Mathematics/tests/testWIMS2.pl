extends = /model/mathinput.pl
grader  =@ /grader/evaluator.py

title = Encadrement d'un carré

before == 
a = rd.randint(1,9) * rd.choice([-1,1])
b = rd.randint(a+1, 10)
bb = b * b
aa = a * a
res1 = aa
res2 = bb
if (a<0 and b>0):
    res1 = 0
    res2 = max(aa, bb)
if (a<0 and b<=0):
    res1 = bb
if (a<0 and b<0):
    res2 = aa
==


input1 =: Input
input1.type = number

input2 =: Input
input2.type = number

text ==
Soit $!x!$ {{input1|component}}un réel vérifiant $! {{a}} \; \leq \; x \ \leq \; {{b}} !$.
Trouvez le meilleur encadrement de $!x^2!$ :
==



form==
{{input1|component}}
$!\; \leq \; x^2 \; \leq \; !$
{{input2|component}}
==

evaluator ==
score = 0
if (input1.value==res1):
    score += 50
if (input2.value==res2):
    score += 50
if (input1.value>input2.value):
    feedback = "Votre encadrement n'a pas de sens car $!" + str(input1.value) + ">" + str(input2.value) + "!$"
    grade = (0, feedback)
if ((input1.value > 0 or input2.value < 0) and a <= 0 and b > 0) :
    feedback = "Votre encadrement n'est pas bon car $!0!$, par exemple, n'est pas compris entre $!" + str(input1.value) + "!$ et $!" + str(input2.value) + "!$. Regardez la représentation graphique de la fonction carré."
    grade = (0, feedback)
==

