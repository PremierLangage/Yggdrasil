extends = /Mathematics/template/mathexpr.pl

title = Calcul puissance

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
def rand_coeff(case):
    a=randint(1,5)
    b=randint(-3,-1)
    c=randint(2,4)
    if case==0:
        return ("",-a,b)
    if case==1:
        return ("",-a,c)
    if case==2:
        return ("-",-a,b)
    if case==3:
        return ("-",-a,c)
    if case==4:
        return ("",a,b)
    if case==5:
        return ("-",a,b)

def latex_number(s,x,y):
    if x<0:
        return "%s ( %d )^{ %d }" % (s,x,y)
    else:
        return "%s %d ^{ %d }" % (s,x,y)


lstexpr=[]
sol=[]
sol_tex=[]
case=list_randint_norep(3,0,5)
for i in range(3):
    s,x,y=rand_coeff(case[i])
    lstexpr.append(latex_number(s,x,y))
    sol.append(simplify(int(s+"1")*Pow(x,y)))
    sol_tex.append(latex(sol[i]))

lstinput=[input1,input2,input3]
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON
input2.config = keyboards_JSON
input3.config = keyboards_JSON
==

text ==
Calculer les expressions suivantes.
==

form ==
{% for input in lstinput %}
<div class="fcontainer">
<span>$% {{ lstexpr[loop.index0] }} = %$</span>{{input|component}}
</div>
{% endfor %}
==

input1 =: MathInput
input2 =: MathInput
input3 =: MathInput

evaluator==
score,_,feedback=ans_tuple_expr([input1.value,input2.value,input3.value],sol)
==

solution ==
Les solutions sont :
<ul>
{% for input in lstinput %}
<li> $! {{ lstexpr[loop.index0] }} = {{ sol_tex[loop.index0] }}!$ </li>
{% endfor %}
</ul>
==
