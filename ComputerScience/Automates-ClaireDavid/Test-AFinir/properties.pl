
extends = base.pl

maxattempt = 3

complete % true
deterministic % true

anim1 % false
anim2 % false

before== #|py|
import random
from automaton import Automaton

editor = Automaton.editor()

properties = [
    { "name": "complete", "error": False, "verify": random.random() < .5, "label": "déterministe" },
    { "name": "deterministic", "error": False ,"verify": random.random() < .5, "label": "complet" },
    { "name": "reachable", "error": False ,"verify": random.random() < .5, "label": "accessible" },
    { "name": "coreachable", "error": False ,"verify": random.random() < .5, "label": "co-accessible" },
    { "name": "infinite", "error": False ,"verify": random.random() < .5, "label": "infini" }
]
==

evaluator== #|py|
from automaton import Automaton
anim1 = anim2 = False
infos, error = Automaton.properties(editor)
if not error:
    for e in editor.automaton['alphabet']:
        if e not in ['a', 'b']:
            error = f'Le symbole "{e}" ne fait pas partie de l\'alphabet {{a, b}}'
            break
        
if error:
    grade = (-1, f'<p class="warning-state">{error}</p>')
else:
    messages = []
    for prop in properties:
        name   = prop["name"]
        verify = prop["verify"]
        label  = prop["label"]
        prop['error'] = False
        if verify != infos[name]:
            prop['error'] = True
            if verify:
                messages.append("Vous devez construire un automate " + label.lower())
            else:
                messages.append("Votre automate ne doit pas être " + label.lower())

    if len(messages) == 0:
        grade=(100, '<p class="success-state">Bonne réponse</<p>')
    else:
        feedback = '<br/>'.join([f'<p class="error-state">{e}</p>' for e in messages])
        grade=(0, feedback)
==

title= Propriétés d'un automate
text==
<p>
Pour cette question, on considère l'alphabet <b>Σ</b> = <b>{{ '{' }} a,b {{ '}' }}</b>.
</p>
<p>
Donnez un exemple d'automate respectant les propriétés suivantes:
</p>
<table>
    <tr>
        {% for prop in properties %}
        <th>{{ prop['label'] }}</th>
        {% endfor %}
    </tr>
    <tr>
        {% for prop in properties %}
        <td {% if prop["error"] %} class="error-state animated pulse infinite" {%endif%}>
            {% if prop['verify'] %} oui {% else %} non {% endif %}
        </td>
        {% endfor %}
    </tr>
</table>
==

form ==
{{ editor|component }}
==





