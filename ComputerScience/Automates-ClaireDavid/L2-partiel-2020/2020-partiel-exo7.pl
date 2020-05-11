
extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = Exercice produit d'automates

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|
from automaton import Automaton

# pour changer le type d'évaluation quand le mode sera implémenté
eval_type = "same_as"

alphabet = "a,b"

# Mettre ici l'automate à déterminiser
# Attention pour l'instant numéroter les états à partir de zéro 
# et les définir dans l'ordre dans #states
automate1 = '''
    #states
    1
    2
    #initials
    1
    #accepting
    2
    #alphabet
    a
    b
    #transitions
    1:a>2
    1:b>1
    2:a>1
    2:b>1
'''

automate2 = '''
    #states
    7
    8
    #initials
    7
    #accepting
    8
    #alphabet
    a
    b
    #transitions
    7:b>7
    7:a>8
    8:a,b>7
'''

# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# TODO - Ecrire string_soluce_produit
#string_solution = Automaton.string_soluce_produit(aautomate1,automate2)

string_solution = '''
    #states
    17
    28
    27
    18
    #initials
    17
    #accepting
    
    #alphabet
    a
    b
    #transitions
    17:a>28
    17:b>17
    28:a>17
    28:b>27
    27:a>18
    27:b>27
    18:a>27
    18:b>17
'''


#automate solution -- le nom solution est forcé par le template
solution = string_solution


#viewer_enonce permet un affichage non modifié de l'automate1 enoncé qui décrit le langage
viewer_enonce1 = AutomatonDrawer()
viewer_enonce1.automaton = automate1
#viewer_enonce permet un affichage non modifié de l'automate2 enoncé qui décrit le langage
viewer_enonce2 = AutomatonDrawer()
viewer_enonce2.automaton = automate2
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$. Faites le produit des deux automates donnés pour construire un automate qui reconnait $!L_1\cap L_2!$.<br>

Automate $!\mathcal{A}_1!$ qui reconnait $!L_1!$:
{{ viewer_enonce1|component }}
Automate $!\mathcal{A}_2!$ qui reconnait $!L_2!$:
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




