

extends = ../templates/editor-regex.pl


generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse

viewer = '''
    #states
    S00
    S01
    S10
    S11
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
alphabet = "a,b"
message = "des mots qui ont un nombre de a modulo 2 différent de son nombre de b modulo 2."
==

title = TD3.1-10
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==

























