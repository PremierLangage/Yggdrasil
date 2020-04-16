# TODO fix bug in step 2 where input components are always None inside form.

extends = base.pl

before==#|py|
from automaton import Automaton
from generator import Generator

# RANDOM AUTOMATON
automaton = Automaton.rand(4, 4, 4)
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
table = Generator.transition_table(automaton, globals())

# RANDOM MULTI CHOICE QUESTION FOR MATCHING WORDS
checkbox, words = Generator.multi_choice_question(automaton)

score, step, maxSteps = 0, 2, 3
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
    grade = (score , '<p class="error-state">Votre automate ne correspond à la réponse attendue</<p>')
==

# STEP 2 EVAL SCRIPT
eval2==#|py|
from evaluator import Evaluator

# since the sandbox does not serialize class to dict we must recreate
# an instance of Automaton class from the dict 'automaton'
automaton = Automaton.parse(automaton)

if Evaluator.eval_transition_table(automaton, table, globals()) == 0:
    score = score + (100 / maxSteps), step + 1
grade = (score, ' ')
==

# STEP 3 EVAL SCRIPT
eval3==#|py|
from evaluator import Evaluator

right, total = Evaluator.eval_multichoice_question(
    checkbox,
    words,
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

text== #|html|
<div>
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

    {% if step > 1 %}
        {{ viewer|component }}
    {% endif %}

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
==

form==#|html|
{% if step == 1 %} <!-- EDITOR STEP -->
{{ editor|component }}
{% elif step == 2 %} <!-- TRANSITION TABLE STEP -->
<table>
    <tr>
        <th></th>
        {% for row in table['head'] %}
        <th>{{ row }}</th>
        {% endfor %}
    </tr>
    {{ table }}
    {% for state, inputs in table['rows'].items() %}
    <tr>
        <td>
            {% if state == QI %}<i class="fas fa-arrow-right"></i>{% endif %}
            {% if state in QF %}<i class="fas fa-arrow-left"></i>{% endif %}
            {{ state }}
        </td>
        {% for input in inputs %}
        <td>
            {{ input|component }}
        </td>
        {% endfor %}
    </tr>
    {% endfor %}
</table>

{% elif step == 3 %} <!-- MULTI CHOICE QUESTION STEP -->
{{ checkbox|component }}
{% else %} <!-- GOOD ANSWER -->
<p class="success-state">Bravo vous avez terminé la série de questions !</p>
{% endif %}


<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const step = {{ step }};
        const maxSteps = {{ maxSteps }};
        const submit = nodes.submit;
         // change submit button content
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

        // disable submit button
        if (step > maxSteps) {
            submit.attr("disabled", true);
        }
    }
</script>
==


