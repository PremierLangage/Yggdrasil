extends = /Mathematics/template/mathinput.pl

title = Calcul de limites

lang = fr

input1 =: MathInput
input2 =: MathInput
input3 =: MathInput
input4 =: MathInput


before ==
keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON
input2.config = keyboards_JSON
input3.config = keyboards_JSON
input4.config = keyboards_JSON

var('x')
latexlim=[]
sol=[]
for i in range(4):
    n=randint(1,4)
    f,g=list_randitem_norep(2,[x**n,exp(x),ln(x)])
    lim=Limit(f-g, x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==

text ==
==

form ==
{% for input in lstinput %}
<div class="fcontainer">
<span>$% {{ lstlim[loop.index0] }} = %$</span>{{input|component}}
</div>
{% endfor %}
==


evaluator==
score,_,feedback=ans_real_extended(input.value,sol)
==



