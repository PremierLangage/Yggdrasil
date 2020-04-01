extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Drag Drop mathématique

before== #|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

# contenu des labels
integrale = "$$\int_0^1 x^2\,dx$$"
fraction =  "$$\frac12 - \frac13$$"
limite = "$$\lim_{x\to +\infty} x\sin(1/x)$$"
determinant = "$$\det\begin{pmatrix} 1 & 2\\ 1 & 3\end{pmatrix}$$"

# contenu des boutons "drop"
qui_vaut_1 = "Poser ici une expression égale à $%1%$"
qui_vaut_tiers = "Poser ici une expression égale à $$1/3$$"
coucou = "coucou $%x^2%$"
# fabrication du groupe
mygroup = DragDropGroup()
# les labels
mygroup.set_label({"integrale": integrale, "fraction": fraction, "limite":limite, "determinant": determinant})
# les drops
mygroup.set_drop({"tiers": qui_vaut_tiers})

mygroup.add_drop({'2': coucou})
mygroup.add_drop({'1': qui_vaut_1})
# les liens corrects
mygroup.set_match_by_name("tiers", "integrale")
#mygroup.set_match_by_name('1', ["limite","determinant"])

# Ce qui suit sert uniquement à faire voyager le groupe dans le grader
qtiers = mygroup.drops["tiers"]
rintegrale = mygroup.labels["integrale"]
rlimite = mygroup.labels["limite"]
rfraction = mygroup.labels["fraction"]
rdeterminant = mygroup.labels["determinant"]
q1 = mygroup.drops['2']
c2 = mygroup.drops['1']

match = mygroup._matches
debug = str(rintegrale)
==

text==
Question : {{ debug }}
==

form==
{{ q1 | component }}
==

settings.feedback = lightscore

evaluator==
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong
mygroup = DragDropGroup()
mygroup.labels = {"lintegrale": rintegrale, "limite": rlimite, "rfraction": rfraction, "determinant": rdeterminant}
mygroup.drops = {"1": q1, "tiers": qtiers}
mygroup._matches = match

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










