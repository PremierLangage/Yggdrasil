
extends = ../templates/editor.pl

maxattempt = 10

## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|

from automaton import Automaton

#    la construction de l'automate pour tester la réponse
automaton = AutomatonEditor(
    automaton= {
        "alphabet": ["a", "b"],
        "initialStates": ["S1"],
        "acceptingStates": ["S3"],
        "states": ["S1", "S2", "S3","S4"],
        "transitions": [
            { "fromState": "S1", "toState": "S2", "symbols": ["b"] },
            { "fromState": "S2", "toState": "S3", "symbols": ["a"] },
            { "fromState": "S3", "toState": "S4", "symbols": ["a"] },
            { "fromState": "S3", "toState": "S4", "symbols": ["b"] },
            { "fromState": "S4", "toState": "S3", "symbols": ["a"] },
            { "fromState": "S4", "toState": "S3", "symbols": ["b"] },
        ]
    }
)

#   transformation de l'automate de json en objet
automaton = Automaton.parse(automaton)

#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l'ensemble des mots qui commencent par ba et dont la longueur est paire."
# peut-on utiliser la syntaxe du viewer ?
==

title = Partiel 2020 Exo1-1
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==


















