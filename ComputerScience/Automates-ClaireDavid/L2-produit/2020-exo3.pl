


extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo 3
#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

automate1 = '''
    #states
    1
    2
    3
    #initials
    1
    #accepting
    2;3
    #alphabet
    a
    b
    #transitions
    1:a>2
    1:b>3
    2:a>3
    2:b>1
    3:a>3
    3:b>1
'''

automate2 = '''
    #states
    3
    4
    5
    #initials
    3
    #accepting
    5
    #alphabet
    a
    b
    #transitions
    3:a,b>4
    4:a>5
    4:b>4
    5:a>5
    5:b>4
'''

# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# choisir le mode pour définir les états finaux
#           default 'intersect'
#            'union' build L1UL2
#            'rightdiff' build L1\L2
#            'leftdiff' build L2\L1
#            'symdiff' build (L2\L1)U(L1\L2) 
string_solution = Automaton.string_soluce_product(automate1,automate2,mode='rightdiff')

#automate solution -- le nom solution est forcé par le template
solution = string_solution

#viewer_enonce permet un affichage non modifié de l'automate1 enoncé qui décrit le langage
viewer_enonce1 = AutomatonDrawer()
viewer_enonce1.automaton = automate1
#viewer_enonce permet un affichage non modifié de l'automate2 enoncé qui décrit le langage
viewer_enonce2 = AutomatonDrawer()
viewer_enonce2.automaton = automate2
#viewer_enonce permet un affichage non modifié de l'automate2 enoncé qui décrit le langage
viewer_sol = AutomatonDrawer()
viewer_sol.automaton = string_solution

==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
{{ viewer_sol|component }}
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$. Faites le produit des deux automates
 donnés pour construire un automate qui reconnaît $!L_1\backslash L_2!$.<br>

Automate $!\mathcal{A}_1!$ qui reconnaît $!L_1!$:
{{ viewer_enonce1|component }}
Automate $!\mathcal{A}_2!$ qui reconnaît $!L_2!$:
{{ viewer_enonce2|component }}
**Contraintes d'écriture pour l'évaluation:**<br>
Afin de vérifier la correction de vos calculs et pas seulement la forme de l'automate, vous respecterez la convention suivante:
<br>
L'état `(p,q)` du produit, où `p` est un état du premier automate et `q` un état du second, sera nommé `pq` c-a-d la concatenation dans l'ordre des deux états qui le constituent.
<br>
Par exemple, l'état `(2,4)` sera nommé `24`, l'état `(1,1)` sera nommé `11`, l'état `(P,6)` sera nommé `P6`.
<br>
*Si vous avez un état constitué de moins ou plus de deux états relisez votre cours en urgence!!*


{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==














