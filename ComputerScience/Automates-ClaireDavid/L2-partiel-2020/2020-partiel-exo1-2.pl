
# Migration à faire

extends = ../templates/editor-L2.pl


title = Partiel 2020 Exo1-1

generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse
#from automaton import Automaton

viewer = AutomatonEditor(
    automaton= {
        "alphabet": ["a", "b"],
        "initialStates": ["S1"],
        "acceptingStates": ["S5"],
        "states": ["S1", "S2", "S3","S4","S5"],
        "transitions": [
            { "fromState": "S1", "toState": "S2", "symbols": ["b"] },
            { "fromState": "S1", "toState": "S3", "symbols": ["b"] },
            { "fromState": "S1", "toState": "S4", "symbols": ["b"] },
            { "fromState": "S2", "toState": "S3", "symbols": ["b"] },
            { "fromState": "S2", "toState": "S4", "symbols": ["b"] },
            { "fromState": "S2", "toState": "S2", "symbols": ["a"] },
            { "fromState": "S2", "toState": "S2", "symbols": ["b"] },
            { "fromState": "S3", "toState": "S4", "symbols": ["a"] },
            { "fromState": "S4", "toState": "S5", "symbols": ["b"] },
        ]
    }
)

#automaton = Automaton.parse(automaton)

alphabet = "a,b"

#message de l'énoncé décrivant le langage
message = "l'ensemble des mots qui commencent par b et finissent pat bab ou bb."
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==






















