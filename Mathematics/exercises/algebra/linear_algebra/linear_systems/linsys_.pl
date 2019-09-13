extends = /Mathematics/template/mathexpr.pl

title = Système linéaire

lang = fr


extracss == #|html| 
<style>
.fcontainer {
    display: flex;
    align-items: center;
}
c-math-input {
    width: 100%;
}
</style>
==

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON
input2.config = keyboards_JSON
input3.config = keyboards_JSON
input4.config = keyboards_JSON

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

form ==
{% for input in lstinput %}
<div class="fcontainer">
<span>$% {{ lstvar[loop.index0] }} = %$</span>{{input|component}}
</div>
{% endfor %}
==

input1 =: MathInput
input2 =: MathInput
input3 =: MathInput
input4 =: MathInput

evaluator ==
if n==2:
    ans=[input1.value,input2.value]
elif n==3:
    ans=[input1.value,input2.value,input3.value]
elif n==4:
    ans=[input1.value,input2.value,input3.value,input4.value]
score,_,feedback=ans_tuple_expr(ans,sol,parentheses=False)
==

solution == 
Les solutions sont $! {{sol_tex}} !$.
==




