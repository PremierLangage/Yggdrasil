#extends = /gift/templates/qshortset.pl
extends = /model/math/expr.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

== 

before==
#montexte="il était une fois un {=lapin, 2    #avec de grandes oreilles} de <br/>\n   pelage {=blanc-vert,bleu,rouge } blabli blablou {=hiver,ete,automne #oh saison} et toc.."

montexte="il était une fois une expression latex <br/>\n    //:MATHINPUT:=sqrt(3),-\sin{x+180},\\frac{1}{n^2}// à résoudre et toc.."

from loadexo import *

# du texte vers le dico des réponses/feedbacks et texte
enonc,dico,types = splitenonce(montexte)

# html complet FORM menu 
#menuForm =gethtmlmenu(enonc,dico)

# Mathinput FORM
mathiForm="Aucune entrée mathématique!!"
if types != []:
    mathiForm=getFormMathinput(enonc,types)

form=mathiForm

#text=text+enonc+"<br/><i> Result= " +str(types)+"</i><br/> form= "+str(mathiForm)

# premier item du dic : les bonnes solutions
lesSol="?"
if types != []:
    lesSol=types[0]
    lesSol=(lesSol[1])

text=text+"<br/><small> lesSol= "+str(lesSol)+"</small>"
sol=""
==

evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_expr
if lesSol == "?":
   score=0
   feedback = "Les solutions sont mal écrites!"
else:
    for sol in lesSol:
        score, error = eval_expr(answers['math'], sol, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
        if error==0:
            break
    feedback = message[error]
==


