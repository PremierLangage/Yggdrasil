#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random
group.items = []

goods = ["`a += a + 2;`", 
         "`a = b++ + c++ + d++ + e++;`",
         "`b = a++ + a;`",
         "`a++ + b++ + c++ + d++;`",
         "`int a, b, c;`<br>`b = 2;`<br>`a = b;`<br>`c = a++ + b++;`",
         "`int a, b; int* p = &a;`<br>`b = (*p)++;`",
         "`int a, b;`<br>`a = b;`<br>`a++ + b++;`"]

bads = ["`a++ + a++;`",
        "`a = a++ + b++ + c++ + d++;`",
        "`b = a++ + --a;`",
        "`--a + a++;`",
        "`int a; int* p = &a; int* q = p;`<br>`*q = (*p)++;`",
        "`int a; int* p = &a;`<br>`a = (*p)++;`"]

nb_goods = random.randint(2, 4)
nb_bads = 6 - nb_goods
ind_goods = random.sample(range(len(goods)), nb_goods)
random.shuffle(ind_goods)
for i in ind_goods:
    group.items.append({"id": str(i), "content": goods[i] })

ind_bads = random.sample(range(len(bads)), nb_bads)
random.shuffle(ind_bads)
for i in ind_bads:
    group.items.append({"id": str(20+i), "content": bads[i] })

random.shuffle(group.items)

note=None
==

author=Nicolas Borie

title=Instructions au comportement indéfini

tag=cours|règle|instruction

text==#|markdown|
La langage C demande une très forte concentration du programmeur car les 
instructions ont à la fois des effets de modifications de la mémoire tout 
en ayant aussi des valeurs. Parmi les règles fondamentales limitant les effets 
trop compliqués à contrôler et prévoir, il y a :

<br>

**Une instruction n'est plus valide si elle produit deux modifications sur **
**la même variable ou le même emplacement mémoire.**

<br>

Selectionner, parmi les expressions suivantes, celles qui sont correctes vis à vis 
de cette règle. Cochez bien toutes les instructions, ou paquet d'instructions, qui 
vous semble corects avant de valider.

<br>

<u>Pas d'indice ici :</u> variable par variable, emplacement mémoire par emplacement mémoire, 
vous devez vérifier que les choses ne sont pas modifiées plus d'une fois dans une même instruction. 
Concentrez vous et n'allez pas trop vite, l'exercice gardera en mémoire la note de votre première 
tentative.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
form+="""

<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

right = 0
total = 0
error = 0
for item in group.items:
    checked = item['checked']
    id_int = int(item['id'])
    if id_int < 20:
        total += 1
        item['css'] = 'error-state'
        if checked:
            right += 1
            item['css'] = 'success-state'
    elif checked:
        error += 1
        item['css'] = 'error-state'
    else:
        item['css'] = ''

nb_error = error + (total - right)
if note is None:
    note = 100*((max([0, total-nb_error])) / total)

if nb_error == 0:
    feedback = '<span class="success-state">Bravo, vous avez bien trouv&eacute; toutes les instructions correctes.</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==


