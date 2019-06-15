extends = /Mathematics/template/mathexpr.pl

title = Chasser une fonction !

lang = fr

before ==
import numpy as np

x=Symbol('x')
T=np.random.randint(1,10)
b=np.random.randint(-10,10)
a=np.random.randint(-10,10)
q = 2*a*pi / T

sol = a*sin(2*pi*x/T)+b
latexf=latex(sol)
latexq=latex(q)

==

text = Ecrire une fonction $% f(x) %$ de période $% {{T}} %$ telle que : $% f({{0}}) = {{b}}%$ et $% f'({{0}}) = {{latexq}}%$.


evaluator==
x=sp.Symbol('x')
import math as math

rep = str2expr(answer['1'])
dif = sp.diff(rep,x)

score = 0
feedback="Votre fonction : $%"+latex(rep)+"%$"

if sp.simplify(rep.subs(x,0)-b)==0 :
    score += 30
    feedback+=" respecte la condition sur $%f(0)%$; "
else :
    feedback+=" ne respecte pas la condition sur $%f(0)%$; "

if sp.simplify(rep.subs(x,0)-rep.subs(x,T))==0 :
    score += 30 
    feedback+=" respecte la période demandée; "
else :
    feedback+=" ne respecte pas la période demandée; "

if sp.simplify(dif.subs(x,0)-q)==0 :
    score +=40
    feedback+=" respecte la condition sur $%f'(0)%$; "
else :
    feedback+=" ne respecte pas la condition sur $%f'(0)%$; "

if (score < 1) :
    feedback = "Votre fonction :  $%"+latex(rep)+"%$ ne répond à aucun critère."
if (score > 99) :
    feedback = "Votre fonction :  $%"+latex(rep)+"%$ est une bonne réponse."
grade = (score,feedback)
==





