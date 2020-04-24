extends = ../templates/editor-L2.pl


## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
#from automaton import Automaton

#    la construction de l'automate pour tester la réponse
viewer = '''
    #states
    S0
    S1
    S2
    #initials
    S0
    #accepting
    S0
    #alphabet
    a
    b
    #transitions
    S0:a>S1
    S1:a>S2
    S2:a>S0
    S0:b>S1
    S1:b>S2
    S2:b>S0
'''
#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "mots qui sont la représentation binaire des entiers multiples de 3 (bit de poids fort à gauche -- big endian)."
==

title = ** multiples de 3
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==

























