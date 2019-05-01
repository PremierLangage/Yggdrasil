extends = /Mathematics/template/mathexpr.pl

title = Conversion

lang = fr

imaginary_unit = i

before ==
a,b=sp.symbols('a b',real=True)
z=a*sp.I+b+1
z=z.expand()
w=sp.I*z
latexz=latex(z)
rpart=sp.re(w.expand(complex=True))
ipart=sp.im(w.expand(complex=True))
==

text ==
$% z={{latexz}} %$ Déterminer la partie réelle et la partie imaginaire de $% i z %$
==

form ==
<div style="align-items: center;display:flex">
  <div style="vertical-align:middle;"> $$Re(z) =$$ </div>
  <div style="width: 100%;">{{input_1}}</div>
  <div style="width: 10%;"></div>
  <div style="vertical-align:middle;"> $$Im(z) =$$ </div>
  <div style="width: 100%;">{{input_2}}</div>
</div>
==

input.1.type = mathexpr
input.2.type = mathexpr
input.2.virtualKeyboardMode = manual
input.2.virtualKeyboards = elementary

evaluator==
score,numerror,feedback=ans_algebraic(answer['1'],rpart)
score,numerror,feedback=ans_algebraic(answer['2'],ipart)
==

