@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]


title = Drag Drop mathématique

before== #|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

# contenu des labels
integrale = r"$$\int_0^1 x^2\, dx$$" # bug d'affichage: \, affiche une virgule
fraction =  r"$$\frac12 - \frac13$$"
limite = r"$$\lim_{x\to +\infty} x\sin(1/x)$$"
determinant = r"$$\det\begin{pmatrix} 1 & 2\\ 1 & 3\end{pmatrix}$$" # bug d'affichage: la matrice s'affiche sur une ligne



# contenu des boutons "drop"
qui_vaut_1 = r"Poser ici une expression égale à $$1$$"
qui_vaut_tiers = r"Poser ici une expression égale à $$1/3$$"

# fabrication du groupe
mygroup = DragDropGroup()
# les labels
mygroup.set_label({"integrale": integrale, "fraction": fraction, "limite":limite, "determinant": determinant})
# les drops
mygroup.set_drop({"1" : qui_vaut_1, "tiers": qui_vaut_tiers})
# les liens corrects
mygroup.set_match_by_name("tiers", "integrale")
mygroup.add_match_by_name("1", ["limite","determinant"])

# Ce qui suit sert uniquement à faire voyager le groupe dans le grader
a = mygroup.drops['1'] 
# bug incroyable : si le nom est 'q' au lieu de 'a', et qu'on remplace dans le text/evaluator, ça bugge
b = mygroup.drops["tiers"]
c = mygroup.labels["integrale"]
d = mygroup.labels["limite"]
e = mygroup.labels["fraction"]
f = mygroup.labels["determinant"]
g = mygroup._matches
==

text==
Question : {{ a | component }} {{ b | component }}
==

form==
{{ c | component }}
{{ d | component }}
{{ e | component }}
{{ f | component }}

==

settings.feedback = lightscore

evaluator==
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong
mygroup = DragDropGroup()
mygroup.labels = {"integrale": c, "limite": d, "fraction": e, "determinant": f}
mygroup.drops = {"1": a, "tiers": b}
mygroup._matches = g

grade=mygroup.eval(grading_function = right_minus_wrong) 
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==












