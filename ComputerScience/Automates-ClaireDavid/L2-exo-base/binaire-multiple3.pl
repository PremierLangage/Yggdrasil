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
    0
    1
    #transitions
    S0:1>S1
    S1:0>S2
    S0:0>S0
    S2:1>S2
    S2:0>S1
    S1:1>S0
'''
#    l'alphabet
alphabet = "0,1"

#    du message de l'énoncé décrivant le langage
message = "les mots qui sont la représentation en binaire (big endian) des entiers multiples de 3. (La représentation big endian correspond à mettre le bit de poids fort à gauche.)"
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

























