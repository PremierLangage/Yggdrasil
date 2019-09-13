# OCE : test 11/09/2019 OK

title=Calcul Mystere III


extends=/ComputerScience/python/template/simpleeval.pl

text==
La variable a est initialise avec la valeur {{a}}.

La question est quelle est la valeur de la variable p a la fin de la suite d'instructions suivante:

{{formula}}


==


before==

import random

random.seed(seed)
a=random.randint(2,7)
formula="    a = {}\n    p = a * a\n".format(a)

p=a*a
for x in range(0,random.randint(2,4)):
    r=random.randint(0,10)
    if r <3 :
        formula += "    p *= a \n"
        p *=  a
    elif r <7:
        formula += "    p = p * a \n"
        p = p * a
    else:
        formula += "    p = p * p \n"
        p = p * p



text += """
 Mais cette fois ci nous souhaitons une reponse sous forme d'une expression simple.

Rappel: x**y en python signifie x a la puissance y."""
res=p
==


form=@ /form/simpletextform.html


evaluator==
ret = response['txt_answer']
if not ret:
    grade= False,'<div class="btn-danger"> Le néant n\'est pas une solution .</div>'
elif "p" in ret or "a" in ret:
    grade= False,'<div class="btn-danger">Une expression sans utiliser ni a ni p svp.</div>'
else:
    try:
        cal=float(ret)
        grade = False,'<div class="btn-danger"> Essai encore, mais sous forme d\'une expression simple et pas sous forme numerique.</div>'
    except:
        try:
            cal=float(eval(ret))
            if cal == res:
                 grade = True,'<div class="btn-success"> Bien joué ! '+str(ret)+" = " +str(res)+'</div>'
            else:
                grade = False,'<div class="btn-danger">  Raté : réessayez  '+str(ret)+" = " +str(res)+'</div>'
        except :
            grade= False,'<div class="btn-danger"> Formule Incorrecte </div>'
==








