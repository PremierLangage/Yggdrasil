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
.blue {
    color:blue;
}
.green {
    color:green;
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
<ol>
{% for input in lstinput %}
<li>
<div class="fcontainer">
<span> $% \displaystyle {{ latexlim[loop.index0] }} = %$</span>{{input|component}}
</div>
</li>
{% endfor %}
</ol>
==


evaluator==
lstinput=[input1,input2,input3,input4]
lstscore=[]
for i,input in enumerate(lstinput):
    score,_,feedback=ans_real_or_inf(input.value,sol[i])
    lstscore.append(score)

if -1 in lstscore:
    score=-1
    for i,input in enumerate(lstinput):
        if lstscore[i]==-1:
            input.css="blue"
else:
    score=0
    for i,input in enumerate(lstinput):
        if lstscore[i]==0:
            input.css="red"
            score=0
        else:
            input.css="green"
==

