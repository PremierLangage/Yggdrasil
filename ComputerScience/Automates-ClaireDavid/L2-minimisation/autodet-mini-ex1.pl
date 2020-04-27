


extends = ../templates/editor-mini.pl


## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
from automaton import Automaton

editor.debug = False
editor.editorHeight = "520px"

viewer = '''
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    #initials
    S00
    #accepting
    S01
    S10
    #alphabet
    a
    b
    #transitions
    S00:a>S10
    S01:a>S11
    S10:a>S00
    S11:a>S01
    S00:b>S01
    S01:b>S00
    S10:b>S11
    S11:b>S10
'''

#    l'alphabet
alphabet = "a,b"
message = 'bb * a(b * a) *'
==

debug =  True

title = Minimisation
text ==

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



























