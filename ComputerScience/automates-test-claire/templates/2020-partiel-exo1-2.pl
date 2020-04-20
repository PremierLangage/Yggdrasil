
############### A FINIR #########################

extends = editor.pl


## On doit pouvoir utiliser le même style que pour count/prefix/suffix/factor pour récupérer un automate et le comparer

maxattempt = 10

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

automaton = Automaton.parse(automaton)

alphabet = "a,b"
message = "l'ensemble des mots qui commencent par b et finissent pat bab ou bb."
# peut-on utiliser la syntaxe du viewer ?


soluce = Automaton.viewer(automaton)
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
















