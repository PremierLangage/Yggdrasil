extends = /Mathematics/template/mathbasic.pl

input1 =: MathInput
input2 =: MathInput
input3 =: MathInput
input4 =: MathInput

extracss == #|html| 
<style>
.fcontainer {
    display: flex;
    align-items: center;
}
c-math-input {
    width: 100%;
}
.red {
    color:red;
}
</style>
==

before ==
lstinput=[input1,input2,input3,input4]

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
<span>$% {{ latexlim[loop.index0] }} = %$</span>{{input|component}}
</div>
{% endfor %}
==


evaluator==
for input in lstinput:
    input.css="red"
#score,_,feedback=ans_real_extended(input.value,sol)
==

