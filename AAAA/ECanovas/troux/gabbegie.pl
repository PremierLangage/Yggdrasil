extends = /model/math/expr.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

== 

before==

montexte="il était une fois une expression latex <br/>\n    //:MATHINPUT:=sqrt{3},-\sin{180},\\frac{1}{3^2}// à résoudre et toc.."
montexte=montexte+"<br/> et la suite //:MATHINPUT:=sqrt{9}//"

from loadexo import *

# du texte vers le dico des réponses/feedbacks et texte
enonc,dico,types = splitenonce(montexte)

# Mathinput FORM
mathiForm="Aucune entrée mathématique!!"
if types != []:
    mathiForm=getFormMathinput(enonc,types)

#form=mathiForm
text=enonc+" et "+str(types.keys())

# premier item du dic : les bonnes solutions
lesSol="?"
if types != []:
    lesSol=types[0]
    lesSol=lesSol[1].split(',')

textsol=""
#for sol in lesSol:
    #if textsol=="":
        #textsol=str(latex2sympy(sol))
    #else:
        #textsol=textsol+" ou "+str(latex2sympy(sol))
sol=""
==

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []

#evaluator ==
#from ast import literal_eval
#from sympy import sympify
#from latex2sympy import latex2sympy
#from evalsympy import eval_expr
#if lesSol == "?":
#   score=0
#   feedback = "Les solutions sont mal écrites!"
#else:
#    for sol in lesSol:
#        s=latex2sympy(sol)
#        score, error = eval_expr(answers['math'], s, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
#        if score==100:
#            break
#    if score !=100:
#        feedback = message[error]
#==

solution ==
La solution est $!{{ textsol|latex}}!$.
==

