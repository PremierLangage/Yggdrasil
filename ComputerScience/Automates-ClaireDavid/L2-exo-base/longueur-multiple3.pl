extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD1 exo3 L11

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = '''
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

#message de l'énoncé décrivant le langage
#message = "le langage { u.v tels que  u,v ∈ Σ* et |u| = 2|v| }"
message = "L= \\\{ u.v\  tels\  que\  u,v \\in \\Sigma^\*\ et\ |u| = 2|v| \\\}"
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez un automate reconnaissant le langage $!{{ message }}!$. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==




























