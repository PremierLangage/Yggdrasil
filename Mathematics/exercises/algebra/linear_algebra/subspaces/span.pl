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
input.config = keyboards_JSON

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

evaluator ==
ans=str2struct(input.value)
M=Matrix(ans).transpose()
score=100
feedback=str(M)
==

