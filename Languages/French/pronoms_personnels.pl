@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Reconnaître les pronoms personnels
==

text==
Sélectionner tous les pronoms personnels apparaissant dans cet extrait de l'oeuvre 
de Victor Hugo : *Les misérables*.

---

==


selectable =: Text
selectable.text== 
Cosette était laide. Heureuse, elle eût peut-être été jolie. Nous avons déjà esquissé cette 
petite figure sombre. Cosette était maigre et blême. Elle avait près de huit ans, on lui en 
eût donné à peine six. Ses grands yeux enfoncés dans une sorte d’ombre profonde étaient 
presque éteints à force d’avoir pleuré. Les coins de sa bouche avaient cette courbe de 
l’angoisse habituelle, qu’on observe chez les condamnés et chez les malades désespérés. Ses 
mains étaient, comme sa mère l’avait deviné, « perdues d’engelures ». Le feu qui l’éclairait 
en ce moment faisait saillir les angles de ses os et rendait sa maigreur affreusement visible. 
Comme elle grelotait toujours, elle avait pris l’habitude de serrer ses deux genoux l’un 
contre l’autre.
==
selectable.selectable % true

before==
==

form==
{{ selectable|component}}
==

evaluator==
score = 100
indices = [4]
for e in selectable.selections:
    e['css'] = "error-state"
    if e['index'] in indices:
        e['css'] = "success-state"
        indices = [i for i in indices if i != e['index']]
    else:
        indices.append(e['css'])

if len(indices) == 0:
    score = 100
    msg = 'Bonne réponse'
else:
    score = 0
    msg = 'Mauvaise réponse'
grade = (score, msg)
==

