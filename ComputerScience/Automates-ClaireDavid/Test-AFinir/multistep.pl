
extends = ../templates/base.pl

before==#|py|
from automaton import Automaton
from generator import Generator

# RANDOM AUTOMATON
automaton = Automaton.rand(3, 3, 3)
A = ','.join(sorted(automaton.alphabet)) 
Q = ','.join(sorted(automaton.states))
I = automaton.initial
F = ','.join(sorted(automaton.finals))
T = []
automaton.iterate(lambda fromState, toState, symb: T.append(f'({fromState}, {symb}, {toState})'))
T = ','.join(T)

# AUTOMATON EDITOR
editor = Automaton.editor()

# AUTOMATON VIEWER
viewer = Automaton.viewer(automaton)

# TRANSITION TABLE
table = Generator.transitionTable(automaton, globals())

# RANDOM MULTI CHOICE QUESTION FOR MATCHING WORDS
checkbox, matchingWords = Generator.stringsInLanguageMCQ(automaton)

score, step, maxSteps = 0, 1, 3
==

# STEP 1 EVAL SCRIPT
eval1==#|py|
matched, error = Automaton.compare(automaton, editor)
if error:
    grade = (-1, f'<p class="warning-state">{error}</p>')
elif matched is True:
    score, step = 100 / maxSteps, step + 1
    grade = (score , ' ')
else:
    grade = (score , '<p class="error-state">Mauvaise réponse</<p>')
==

# STEP 2 EVAL SCRIPT
eval2==#|py|
from evaluator import Evaluator

# since the sandbox does not serialize class to dict we must recreate
# an instance of Automaton class from the dict 'automaton'
automaton = Automaton.parse(automaton)

if Evaluator.evalTransitionTable(automaton, table, globals()) == 0:
    score = score + (100 / maxSteps), step + 1
grade = (score, ' ')
==

# STEP 3 EVAL SCRIPT
eval3==#|py|
from evaluator import Evaluator

right, total = Evaluator.evalStringsInLanguageMCQ(
    checkbox,
    matchingWords,
    withanswer=True
)
if right == total:
    score, step = 100, step + 1
    grade = (score, ' ')
else:
    grade = (score, f"<p class='warning-state'>{right} / {total}</p>")
==

evaluator==
from automaton import Automaton
exec(globals()[f"eval{step}"])
==

title= Construction d'automates

text==
<div style="display: flex; align-items: center">
    <div style="box-sizing: border-box; margin: 0 8px 0 0;">
    Soit l’automate A = (Σ, Q, QI, QF, ∆) où:
    <ul>
        <li> Σ = {{ '{' }} {{ A}}  {{ '}' }},</li>
        <li> Q =  {{ '{' }} {{ Q }} {{ '}' }},</li>
        <li> QI =  {{ '{' }} {{ I }} {{ '}' }},</li>
        <li> QF =  {{ '{' }} {{ F }} {{ '}' }}, et</li>
        <li> ∆ =  {{ '{' }} {{ T }} {{ '}' }}.</li>
    </ul>

    <p {% if step > 1 %} class="success-state" {% endif %}>
        <em>1. Représentez cet automate sous forme de graphe.</em>
    </p>

    {% if step >= 2 %}
    <p {% if step > 2 %} class="success-state" {% endif %}>
        <em>2. Donnez la table de transition de l'automate en remplissant le tableau ci-dessous.</em>
    </p>
    {% endif %}

    {% if step >= 3 %}
    <p {% if step > 3 %} class="success-state" {% endif %}>
        <em>3. Parmi les mots suivants, lesquels sont reconnus par cet automate?</em>
    </p>
    {% endif %}
    </div>

    <div style="box-sizing: border-box; margin: 0 0 0 8px;">
        {% if step > 1 %}
        {{ viewer|component }}
        {% endif %}
    </div>
</div>
==

form==#|html|
{% if step == 1 %}
{{ editor|component }}
{% elif step == 2 %}
<table>
<tr>
<th></th>
{% for row in table['head'] %}
<th>{{ row }}</th>
{% endfor %}
</tr>
{% for state, rows in table['rows'].items() %}
<tr>
    <td>
        {% if state == QI %}<i class="fas fa-arrow-right"></i>{% endif %}
        {% if state in QF %}<i class="fas fa-arrow-left"></i>{% endif %}
        {{ state }}
    </td>
    {% for row in rows %}
    <td>
        {{ row|component }}
    </td>
    {% endfor %}
</tr>
{% endfor %}
</table>
{% elif step == 3 %}
{{ checkbox|component }}
{% else %}
<p class="success-state">Bravo vous avez terminé la série de questions !</p>
{% endif %}
<script>
    function onReadyPL(nodes) {
        const step = {{ step }};
        const maxSteps = {{ maxSteps }};
        const submit = nodes.submit;
        if (step < maxSteps) {
            submit.html(`
                <i id="validate" class="fas fa-arrow-right"></i>
                <span class="ion-hide-md-down">Suivant</span>
            `);
        } else {
            submit.html(`
                <i id="validate" class="fas fa-check"></i>
                <span class="ion-hide-md-down">Valider</span>
            `);
        }
        if (step > maxSteps) {
            submit.attr("disabled", true);
        }
    }
</script>
==












