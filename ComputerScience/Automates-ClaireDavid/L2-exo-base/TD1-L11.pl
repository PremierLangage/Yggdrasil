
extends = ../templates/editor-L2.pl


## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
#from automaton import Automaton

#    la construction de l'automate pour tester la réponse
viewer = '''
    #states
    S0
    S1
    #initials
    S0
    S1
    #accepting
    S0
    S1
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S1:b>S0
'''
#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l'ensemble des mots  ne contenant ni aa, ni bb comme facteur"
==

title = TD1 exo3 L12
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==

























