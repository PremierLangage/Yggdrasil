extends = ../templates/new_editor-L2.pl


#* titre de l'exercice
title = *** TD3.1-10


#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = '''
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

#message de l'énoncé décrivant le langage
message = "des mots qui ont un nombre de a modulo 2 différent de son nombre de b modulo 2."
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==


























