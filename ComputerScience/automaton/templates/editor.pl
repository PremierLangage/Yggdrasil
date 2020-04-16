# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE

#! linter:require:generate

extends = /ComputerScience/automaton/templates/base.pl

maxattempt = 3
#*
#*
#* DD
#*
#*
#generate % null

title= 
text= 

before== #|py|
from automaton import Automaton
score = -1
attempt = 0
maxattempt = int(maxattempt)
deterministic = True

if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

editor = Automaton.editor()
viewer = Automaton.viewer(automaton)
alphabet = ', '.join(list(alphabet))
==

evaluator== #|py|
from automaton import Automaton
if attempt >= maxattempt:
    grade = (score, '<p class="warning-state">Un automate attendu était le suivant:</p>')
else:
    attempt += 1
    match, error = Automaton.compare(automaton, editor)
    if (error or not match) and attempt >= maxattempt:
        grade = (score, '<p class="warning-state">L\'automate déterministe suivant était une réponse possible à cette question.</p>')
    elif error:
        grade = (-1, f'<p class="warning-state">{error}</p>')
    elif match is True:
        score = 100
        infos, _ = Automaton.informations(editor)
        deterministic = infos['deterministic']
        grade = (score, ' ')
    else:
        score = 0
        grade=(score, '<p class="error-state">L\'automate que vous avez construit ne correspond pas à une réponse attendue.</<p>')
==

form== #|html|
<!-- RENDER AUTOMATON VIEWER IF MAX ATTEMPT IS REACHED -->
{% if attempt >= maxattempt %}
{{ viewer|component }}
{% endif %}

<!-- RENDER AUTOMATON VIEWER IF SCORE IS 100 -->
{% if score == 100  %}
    <p class="success-state">Bravo l'automate que vous avez construit est une bonne réponse.</p>
    {% if not deterministic %}
         <p class="success-state">L'automate déterministe suivant était aussi une bonne réponse :</p>
        {{ viewer|component }}
    {% endif %}
{% endif %}

<!-- RENDER THE AUTOMATON EDITOR -->
{{ editor|component }}

<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button

        // hide submit button if needed.
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);
    }
</script>
<p>
<ul>
    <li> Pour créer un nouvel état, double clic gauche. Utilisez les boutons pour changer le type de votre état.<br>
    <it> Ne pas renommer les états - il y a un bug</it></li>
    <li>
    Pour ajouter une transition cliquer sur le point orange de l'état de départ
    et tirer votre transition jusqu'à l'état d'arrivée.
    Utilisez ensuite "changer Transition" pour ajuster la lettre étiquettant de la transition
    </li>

    </ul>
    </p>
==










