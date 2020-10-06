extends = /model/mathinput.pl

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

text ==
Calculer les limites suivantes.
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

input.virtualKeyboards = sets

evaluator==
lstinput=[input1,input2,input3,input4]
lstinput=lstinput[:ninput]
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
    score=100
    for i,input in enumerate(lstinput):
        if lstscore[i]==0:
            input.css="red"
            score=0
        else:
            input.css="green"
==


