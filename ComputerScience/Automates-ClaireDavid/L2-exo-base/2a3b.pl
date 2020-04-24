extends = ../templates/editor-L2.pl


## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
#from automaton import Automaton

#    la construction de l'automate pour tester la réponse
viewer = '''
    #states
    S00
    S01
    S02
    S10
    S11
    S12
    #initials
    S00
    #accepting
    S01
    #alphabet
    a
    b
    #transitions
    S00:a>S10
    S01:a>S11
    S02:a>S12
    S10:a>S00
    S11:a>S01
    S12:a>S02
    S1:a>S1
    S1:b>S0
'''
#    l'alphabet
alphabet = "a,b"

#    du message de l'énoncé décrivant le langage
message = "l'ensemble des mots ayant un nombre de a pair et un nombre de b égal à 1 modulo 3."
==

title = TD1 exo3 L4
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==























