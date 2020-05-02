extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD1 exo3 L13

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = '''
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
    S00:b>S01
    S01:b>S02
    S02:b>S00
    S10:b>S11
    S11:b>S12
    S12:b>S10
'''

#message de l'énoncé décrivant le langage
message = "l'ensemble des mots ayant un nombre de a pair et un nombre de b égal à 1 modulo 3."
==
#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



























