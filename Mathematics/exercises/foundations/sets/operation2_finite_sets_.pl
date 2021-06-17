# Author : D. Doyen
# Tags : sets, finite sets
# 19/8/2020

extends = /model/mathquill.pl

title = Opérations sur les ensembles

param.cases % [1, 2, 3, 4]

before ==
items = list(range(10))

A = rand_finiteset(randint(3, 7), items)
B = rand_finiteset(randint(3, 7), items)
C = rand_finiteset(randint(3, 7), items)

case = randitem(param['cases'])

if case == 1:
    expr = r"(A \cap B) \cup C"
    sol = Union(Intersection(A, B), C)
elif case == 2:
    expr = r"(A \cup B) \cap C"
    sol = Intersection(Union(A, B), C)
elif case == 3:
    expr = r"A \cap (B \cup C)"
    sol = Intersection(Union(B, C),A)
elif case == 4:
    expr = r"A \cup (B \cap C)"
    sol = Union(Intersection(B,C),A)

elif case == 5:
    expr = r"(A \cup B) \setminus C"
    sol = C.complement(Union(A,B))
elif case == 6:
    expr = r"(A \setminus B) \cup C"
    sol = Union(C,B.complement(A))
elif case == 7:
    expr = r"A \cup (B \setminus C)"
    sol = Union(A,C.complement(B))
elif case == 8:
    expr = r"A \setminus (B \cup C)"
    sol = Union(B,C).complement(A)

elif case == 9:
    expr = r"(A \cap B) \setminus C"
    sol = C.complement(Intersection(A,B))
elif case == 10:
    expr = r"(A \setminus B) \cap C"
    sol = Intersection(C,B.complement(A))
elif case == 11:
    expr = r"A \cap (B \setminus C)"
    sol = Intersection(A,C.complement(B))
elif case == 12:
    expr = r"A \setminus (B \cap C)"
    sol = Intersection(B,C).complement(A)
==

text == 
On considère les ensembles suivants :
$$ A= {{ A|latex }},\ B= {{ B|latex }},\ C= {{ C|latex }} .$$
Déterminer $! {{expr}} !$.
==

evaluator ==
score, error = eval_set(answers['math'], sol)
feedback = message[error]
==

solution ==
La solution est $! { {{sol|latex}} } !$.
==



