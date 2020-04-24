

extends = ../templates/editor-L2.pl


## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
#from automaton import Automaton

#    la construction de l'automate pour tester la réponse
#*
#*  This script must define the following variables:
#*   
#*  **viewer** => an automaton in one of the accepted formats (string, regex, object...)
#*               This automaton is considered as the answer and it will be presented to the student at the end.
#*  Example
viewer = '''
    #states
    S0
    S1
    #initials
    S0
    #accepting
    S1
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S1:a>S1
    S1:b>S0
'''


#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l'ensemble des mots mots dont la 4ème lettre à partir de la droite est un a"
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






















