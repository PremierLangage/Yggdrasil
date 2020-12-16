extends = /Mathematics/template/mathinput.pl

title = Conversion


before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON
a=randint(1,3)
with evaluate(False):
    z=a*exp(I*pi/4)
sol=expand_complex(z)

sol_tex=latex(sol)
z_tex=latex(z)
==

text == 
Ecrire sous forme cartésienne le nombre complexe $! \\large {{z_tex}} !$.
==

evaluator==
score,_,feedback=ans_complex(input.value,z,form="exponential")
==

solution ==
La solution est $! {{sol_tex}} !$.
==







