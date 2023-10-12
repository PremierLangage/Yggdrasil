
extends = /Mathematics/template/mathdragdrop.pl

title = Image d'un ensemble par une fonction à valeurs entières

lang = fr

@datafile.json [datafile.json]

before ==
import random
import json

with open("datafile.json","r") as f:
    data=json.load(f)

random.shuffle(data)
this_data = data[0]

num_tags = len(this_data['good']) + len(this_data['bad'])
indices = list(range(num_tags))
random.shuffle(indices)
good_indices = indices[:len(this_data['good'])]
bad_indices = indices[len(this_data['good']):]
drag_tags = []
for tag in this_data['good'] :
    drag_tags.append(
        render_drag_tag({
            'name': str(good_indices[this_data['good'].index(tag)]), 
            'display':tag['display'], 
            'style':tag['style']
        })
    )

for tag in this_data['bad'] :
    drag_tags.append(
        render_drag_tag({
            'name': str(bad_indices[this_data['bad'].index(tag)]), 
            'display':tag['display'], 
            'style':tag['style']
        })
    )

drop_tag = render_drop_tag({
    'name':'answer', 
    'display': 'Placer la réponse ici', 
    'style': 'width: 16em; height: 3em'
    })
==

text== 
Soit l'application $%{{ this_data.fmaps }}%$ définie par 
$${{ this_data.fdef }}$$
On pose $%A = {{this_data.set}}.%$
Quelle est l'image de $%A%$ par $%f%$ ?
== 

form==
$% A = %$ {{ drop_tag | safe }}
<br>
{% for tag in drag_tags %}
    {{ tag | safe }}
{% endfor %}
==

evaluator ==
score = 0

for index in good_indices:
    if answer['drag_'+str(index)] == 'drop_answer' :
        score = 100
if score == 0 :
    feedback = "Euh, t’es vraiment nul!"
else :
    feedback = "Trop fort !"
==















