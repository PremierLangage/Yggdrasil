extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Vérification solution BMC ou Arden

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
#solution = Automaton.parse('(a*ba*b)*a*')

solution = '''
    #states
    1
    2
    3
    4
    #initials
    1;2
    #accepting
    3;4
    #alphabet
    a
    b
    #transitions
    1:a>2
    1:b>3
    1:b>4
    2:a>2
    2:a>3
    3:b>4
    4:b>4
    4:a>3
'''


#message de l'énoncé décrivant le langage
message = "des mots qui ont un nombre pair de b."
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez une expression reconnaissant le langage donné par l'automate ci-dessous <br>

Automate $!\mathcal{A}_1!$ qui reconnaît $!L_1!$:
{{ viewer_enonce1|component }}

Cet exercice permet de vérifier votre résultat de l'application de BMC ou Arden sur l'automate du partiel 2022.<br/>
 <strong>Attention, cela ne permet pas de vérifier que vous appliquez la méthode choisie correctement.
  En cas de doute, rapprochez-vous de vos enseignants.</strong><br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==




























