
############### A FINIR #########################

extends = editor.pl


## On doit pouvoir utiliser le même style que pour count/prefix/suffix/factor pour récupérer un automate et le comparer

maxattempt = 1

generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse
from automaton import Automaton

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

automaton = Automaton.parse(automaton)

alphabet = "a,b"
message = "l'ensemble des mots qui commencent par ba et dont la longueur est paire"
# peut-on utiliser la syntaxe du viewer ?
==

title = Exemples de langages
text ==

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==















