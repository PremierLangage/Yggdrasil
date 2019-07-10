extends = /Mathematics/template/mathexpr.pl

title = Développement

lang = fr

before ==
var('x')
d=int(param['degree'])
nc=int(param['ncoeff'])

P=rand_int_poly(randint(nc-1,d),nc,5,x)
Q=rand_int_poly(randint(nc-1,d),nc,5,x)
R=rand_int_poly(randint(nc-1,d),nc,5,x)

if param['formula']=="PQ+R":
    T1=P
    T2=Q*R
latexT1=latex(T1)
latexT2=latex(T2)
sol=T1
==

text = Développer $$ {{latexT1}} + {{latexT2}}.$$

evaluator==
var('x')
score,numerror,feedback=ans_poly_expanded(answer['1'],sol,x)
==





