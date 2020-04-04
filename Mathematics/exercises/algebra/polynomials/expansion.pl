extends = /model/mathinput.pl

title = Développement

before ==
var('x')
d = param['degree']
nc = param['ncoeff']

P = rand_int_poly(randint(nc-1,d),nc,5,x)
Q = rand_int_poly(randint(nc-1,d),nc,5,x)
R = rand_int_poly(randint(nc-1,d),nc,5,x)

if param['formula']=="PQ+R":
    T1=P
    T2=Q*R

sol=T1 + T2
==

text = Développer $$ {{T1.latex}} + {{T2.latex}}.$$

evaluator==
var('x')
score,numerror,feedback=eval_poly(input.value,sol,x)
==







