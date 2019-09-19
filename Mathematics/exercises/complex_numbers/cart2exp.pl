extends = /Mathematics/template/mathinput.pl

title = Conversion

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON
a=randint(1,3)
theta=randitem([pi/4,3*pi/4,5*pi/4,7*pi/4])
with evaluate(False):
    z=a*exp(I*theta)
sol_tex=latex(z)
z=expand_complex(z)
z_tex=latex(z)
==

text == 
Ecrire sous forme exponentielle le nombre complexe $! \\large {{z_tex}} !$.
==

evaluator==
score,_,feedback=ans_complex(input.value,z,form="exponential")
==

solution ==
La solution est $! {{sol_tex}} !$.
==




