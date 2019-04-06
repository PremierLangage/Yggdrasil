extends = /template/mathbasic3.pl
select_container =@ /input/select/container.html
select_script =
select_links = 
select_build =@  /input/select/buildcontext.py
title = Rang d'une matrice

lang = fr

matsize = 3

coeffbound = 5

before ==
rk=randint(1,3)
A=rand_int_matrix_givenrank(3,rk)
sol=A.rank()
latexA=latex(A)
latexsol=latex(sol)
==

text ==
On considère la matrice $$ A= {{latexA}}. $$
==

form ==
Quel est le rang de cette matrice ? {{input_1}}
==

input.1.type = select

input.1.choices ==
0
1
2
3
==

evaluator ==
if sol==int(answer['1']):
    score=100
else:
    score=0
feedback=len(input['1']['choices'])
==
