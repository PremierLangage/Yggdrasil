extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Partiel 2020 Exo1-1

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

alphabet = "a,b"


#langage solution -- le nom solution est forcé par le template
solution = '''
    #states
    S1
    S2
    S3
    S4
    #initials
    S1
    #accepting
    S3
    #alphabet
    a
    b
    #transitions
    S1:b>S2
    S2:a>S3
    S3:a>S4
    S3:b>S4
    S4:a>S3
    S4:b>S3
'''


#message de l'énoncé décrivant le langage
message = "l'ensemble des mots qui commencent par ba et dont la longueur est paire."
==


#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==

On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez un automate reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==
























