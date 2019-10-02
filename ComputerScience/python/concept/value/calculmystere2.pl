# OCE : test 11/09/2019 OK

title=Calcul Mystere II

extends=/ComputerScience/python/template/simpleeval.pl

text==
On suppose qu'il existe une variable `a` initialisée avec la valeur 2.  
Quelle est la valeur de la variable `p` à la fin de la suite d'instructions suivante ?  
*On demande une réponse sous forme d'une expression arithmétique, pas seulement le résultat numérique.*
==



before==#|python|
import random
random.seed(seed)

formula="""
<br/>
a = 2\n<br/>
p = a * a\n<br/>
"""

a=2
p=a*a
for x in range(0,random.randint(2,4)):
    r=random.randint(0,10)
    if r <7 :
        formula += "    p = p * a \n<br/>"
        p = p * a
    else:
        formula += "    p = p * p \n<br/>"
        p = p * p

text +=formula
text += """
 Mais cette fois ci nous souhaitons une reponse sous forme d'une expression simple.

Rappel: x**y en python signifie x a la puissance y."""
testh="<small>{{seed}}</small>"
res=p
==


form=@ /form/simpletextform.html


evaluator==
ret = response['txt_answer']

try:
    cal=float(ret)
    grade = False," Essai encore, mais sous forme d'une expression simple et pas sous forme numerique."
except:
    try:
        cal=eval(ret)
        if cal == res:
            grade = True,'<div class="btn-success"> Bien joué ! '+str(ret)+" = " +str(res)+'</div>'
        else:
            grade = False,'<div class="btn-danger">  Raté : réessayez </div>'
    except :
        grade= False,'<div class="btn-danger"> Formule Incorrecte</div>'

==







