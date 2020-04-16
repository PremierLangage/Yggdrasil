extends = base.pl


# BUILDER SCRIPT
before== #|py|

import random
from automaton import Automaton

# create an empty automaton editor 
editor = Automaton.editor()
alphabet = ', '.join(['a, b'])
# a list of properties to check on the automaton of the student.
properties = [
    { "name": "complete", "error": False, "verify": random.random() < .5, "label": "déterministe" },
    { "name": "deterministic", "error": False ,"verify": random.random() < .5, "label": "complet" },
    { "name": "reachable", "error": False ,"verify": random.random() < .5, "label": "accessible" },
    { "name": "coreachable", "error": False ,"verify": random.random() < .5, "label": "co-accessible" },
    { "name": "infinite", "error": False ,"verify": random.random() < .5, "label": "infini" }
]

==

# GRADER SCRIPT
evaluator== #|py|

from automaton import Automaton

# retrieve the properties of the student's automaton 
infos, error = Automaton.editor_properties(editor)

if not error:
    # ensure that the symbols in the transitions are valid.
    for e in editor.automaton['alphabet']:
        if e not in alphabet.split(','):
            error = f'Le symbole "{e}" ne fait pas partie de l\'alphabet {alphabet}'
            break

if error: # a syntax error occured
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
Pour cette question, on considère l'alphabet <b>Σ</b> = <b>{{ '{' }} {{ alphabet }} {{ '}' }}</b>.
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






