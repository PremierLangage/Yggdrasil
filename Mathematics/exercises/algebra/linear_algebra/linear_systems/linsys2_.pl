extends = /Mathematics/template/mathinput.pl

title = Système linéaire


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n=int(param['size'])
coeffbound = int(param['coeffbound'])
sparsity=float(param['sparsity'])
A=rand_int_matrix_invertible(n,coeffbound,[0],sparsity)
B=rand_int_matrix(n,1,coeffbound)
sol=list(linsolve((A, B)))[0]
sys_tex=latexsys(A,B)
lstvar=["x","y","z","t","u","v"]
lstinput=[input1,input2,input3,input4]
lstinput=lstinput[:n]

sol_tex=""
for i in range(n-1):
    sol_tex += r" %s = %s, " % (lstvar[i],sol[i])
sol_tex+=r"%s = %s" % (lstvar[n-1],sol[n-1])
==

text ==
Déterminer les solutions du système
$$ {{sys_tex}} $$
==



evaluator ==
score,_,feedback=ans_tuple_expr(ans,sol,parentheses=True)
==

solution == 
Les solutions sont $! {{sol_tex}} !$.
==
