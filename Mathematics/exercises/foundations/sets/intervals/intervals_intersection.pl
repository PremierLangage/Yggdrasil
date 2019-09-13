extends = /Mathematics/template/mathexpr.pl

title = Intervalles

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input1.config = keyboards_JSON

x0,x1,x2,x3=sorted(list_randint_norep(4,-5,5))

cas=randint(1,4)
if cas<=2:
    a,b,c,d=x0,x2,x1,x3
elif cas==3:
    a,b,c,d=x0,x1,x2,x3
elif cas==4:
    a,b,c,d=x1,x2,x0,x3

interv=[rand_interval_type(a,b),rand_interval_type(c,d)]
rd.shuffle(interv)
A,B=interv
sol=A.intersection(B)
A_tex=latex(A)
B_tex=latex(B)
sol_tex=latex(sol)
expr="A \cap B"
==

text == 
On considère les intervalles $! A= {{A_tex}} !$ et $! B= {{B_tex}}. !$
Déterminer $! {{expr}} !$.
==

evaluator==
score,_,feedback=ans_rset(input1.value,sol)
==

solution==
Cet ensemble est $! {{sol_tex}} !$.
==

