extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Vérification de la solution de BMC ou Arden du partiel 2022

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
    2;4
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
#viewer_enonce permet un affichage non modifié de l'automate1 enoncé qui décrit le langage
viewer_enonce1 = AutomatonDrawer()
viewer_enonce1.automaton = solution

#message de l'énoncé décrivant le langage
message = "donné par l'automate $!\mathcal{A}_1!$  ci-dessous."
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text ==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez une expression reconnaissant le langage {{ message }}  <br>

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




























