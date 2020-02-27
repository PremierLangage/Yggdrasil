extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==
from customdragdrop import CustomDragDrop, DragDropGroup
import random as rd

lt="&lt;"
gt="&gt;"

n = 4

numbers = []
sol = []
for _ in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    if a < b:
        sol.append(lt)
    else:
        sol.append(gt)

label = CustomDragDrop.Labels([lt,gt])
drop = CustomDragDrop.Drops(n)
group = DragDropGroup(labels = label, drop_zones = drop)
==

text==
Comparer les nombres suivants avec les symboles {{ label[0] | component }} et {{ label[1] | component }}.
==

form==
<ul>
{% for i in range(4) %}
<li> {{ numbers[i][0] }} {{ drop[i]|component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==

evaluator==
from customdragdrop import CustomDragDrop, DragDropGroup

#grade=CustomDragDrop.eval(drop,sol)
grade = group.eval()


# l'essai grade = group.eval() ne fonctionne pas, je ne sais pas pourquoi
# [DD] : Problème de sérialisation/désérialisation de l'objet group, non ?
# Les objets qui ne font pas partie des types de base Python (int, float, str, list, tuple, dic) 
# sont transformés en dictionnaires vides au moment de la conversion en JSON.
# Il faut donc faire la sérialisation/désrialisation "à la main" comme avec SymPy.
# Ou y a peut-être moyen d'inclure des méthodes internes de sérialisation/désérialisation dans la classe
# qui seraient automatiquement appelées par jsonpickle (vu que c'est une classe sur laquelle on a la main).
# [ES] : Oui en effet ça doit être ça, mais alors toute l'idée d'encapsulation 
# des composants dans des classes qui s'occupent de l'évaluation
# est un peu remise en cause, à moins comme tu dis que les classes s'occupent du pb serialisation/déserialisation
# Ce que je comprends pas c'est que dans l'exemple checkbox_multiples.pl ça fonctionne.
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==





