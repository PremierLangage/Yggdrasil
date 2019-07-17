@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.allow_reroll=True

title= Calcul d'une énergie d'activation d'une réaction chimique  à partir d'un taux de conversion
author= Estelle GURVIEZ
tag=chimie|cinétique chimique|énergie d'activation|taux de conversion|calculs à partir de lois cinétiques|ordre 0, 1 ou 2


text==
On considère une espèce chimique A qui réagit selon une réaction d’ordre {{n}}. 
Il faut `{{t1}} minutes` à `T1={{T1}}°C` pour réaliser `{{a}}%` de la réaction. 
Il ne faut plus que `{{t2}} minutes` à `T2={{T2}}°C` pour obtenir le même résultat.

On donne la constante des gaz parfaits $% R= 8,31 J.mol^{-1}.K^{-1} %$.

Déterminer l’énergie d’activation de la réaction à l’unité près : 
==



form==
<div class="input-group">
    $%  E_a = %$
        <input id="form_answer" type="text" class="form-control" value="{{ answers__.answer }}" required/>
    $% kJ.mol^{-1}  %$
</div>
==



before== #|python| 
import random 
random.seed(seed)

n = random.choice([0,1,2])
t1 = random.choice(range(10,241,5))
t2 = random.choice(range(5, t1, 5))
T1 = random.choice(range(0, 99, 2))
T2 = random.choice(range(T1+2, 101, 2))
a = random.choice(range(3,91,1))
==



evaluator==
import traceback
import sys
import math

failure_feedback = """
<div style="background-color:darkred;color:white;padding:4px">
    Mauvaise réponse. <br><br>
    Procédure à suivre : 
    <ul>
        <li>1) Obtenir l’équation-horaire, relation entre la concentration du réactif en fonction du temps t, fonction mathématique qui dépend de l’ordre de la réaction et qui s’obtient par résolution de l’équation différentielle à variables séparables 
        </li>
        <li>2a) Le pourcentage de réaction correspond au taux de conversion c’est-à-dire à la proportion de réactifs ayant réagi. La concentration du réactif restant est égale à la concentration initiale moins celle qui a réagi soit $% [A] = [A]0 - 0,01 a [A]0 = (1- 0,01 a) [A]0 %$
        </li>
        <li>2b) Attention donc à bien utiliser la concentration du réactif restant dans l’équation horaire afin d’en déduire la valeur de la constante de vitesse k à la température considérée. Calculer k à chacune des deux températures données. 
        </li>
        <li>3) Résoudre alors le système à deux équations, deux inconnues, A facteur préexponentiel et Ea énergie d’activation, en appliquant la loi d’Arrhénius sous forme logarithmique ln k = f(T)
        </li>
    </ul>
</div>
"""

success_feedback = """
<div style="background-color:darkgreen;color:white;padding:4px">
    Félicitations ! <br>
    Vous avez réussi le calcul de l’énergie d’activation pour l’ordre {}.
    Il est intéressant de remarquer que la constante de vitesse k est inversement proportionnelle au temps t mis par l’espèce chimique  A pour être converti avec un taux de a % quel que soit l’ordre n. 
    <ul>
        <li>ordre 0 $% k = 0,01 a [A]0/ t  %$</li>
        <li>ordre 1 $% k = - ln (1 - 0,01 a)/ t  %$</li>
        <li>ordre 2 $% k = 0,01 a / (1 - 0,01 a) [A]0t %$</li>
    </ul>
    L’énergie d’activation ne dépend donc que des 2 temps t1 et t2 et des 2 températures T1 et T2 et est indépendante de l’ordre de la réaction et du taux de conversion a ! Attention à ne pas généraliser… Ceci est possible car les temps mesurés t1 et t2 correspondent au même taux de conversion !
</div>
<br>
""".format(n)

res = (8.31*math.log1p(t2/t1)*0.001)/(1/(T2+273)-1/(T1+273))
res = round(res, 3)
try: 
    f = float(response['answer'])
    print(f, res, file=sys.stderr)
    if res - 0.0011 <= f <= res + 0.0011:
        grade = (100, success_feedback)
    else:
        grade = (0, failure_feedback)
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer une valeur correcte")
==


