extends = /Mathematics/template/mathinput.pl

title = Représentation paramétrique des sous-espaces

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

n=1
m=3
d=m-n
coeffbound = 4
A=rand_int_matrix_fullrank(n,m,coeffbound)
B=zeros(n,1)
sys_tex=latexsys(A,B)
lstvec=["u","v","w"]
input=[input1,input2]
==

text ==
On considère l'ensemble des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} $$
Trouver un vecteur qui engendre cet ensemble.
==

form ==
{% for i in range(d) %}
<div class="fcontainer">
<span>$% {{ lstvec[i] }} = %$</span>{{input[i]|component}}
</div>
{% endfor %}
==

input1 =: MathInput
input2 =: MathInput
input3 =: MathInput
input4 =: MathInput

evaluator ==
input=[input1,input2]

ans1=str2struct(input1.value)
ans2=str2struct(input2.value)
M=Matrix([ans1,ans2]).transpose()
score=100
feedback=str(M)
==

