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
    0
    1
    2
    #initials
    0
    #accepting
    1
    #alphabet
    a
    b
    #transitions
    0:a>1
    0:b>2
    1:a>0
    1:b>1
    2:a,b>2
'''

automate2 = '''
    #states
    4
    5
    6
    #initials
    4
    #accepting
    6
    #alphabet
    a
    b
    #transitions
    4:a,b>5
    5:a>6
    5:b>5
    6:a,b>6
'''



# Permet de faire la comparaison same_as imposé le template -- A ajuster cf TODO
# TODO - Ecrire string_soluce_produit
#string_solution = Automaton.string_soluce_produit(aautomate1,automate2)

string_solution = '''
    #states
    14
    25
    35
    16
    36
    26
    #initials
    14
    #accepting
    26
    #alphabet
    a
    b
    #transitions
    14:a>25
    14:b>35
    25:a>16
    25:b>25
    35:a>36
    35:b>35
    16:a>26
    16:b>36
    36:a,b>36
    26:a>16
    26:b>26
'''


#automate solution -- le nom solution est forcé par le template
solution = string_solution


#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce1 = AutomatonDrawer()
viewer_enonce1.automaton = automate1
#viewer_enonce permet un affichage non modifié de l'automate enoncé qui décrit le langage
viewer_enonce2 = AutomatonDrawer()
viewer_enonce2.automaton = automate2


==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$. Faites de le produit des deux automates ci-dessus pour construire un automate qui reconnait $!L_1\cap L_2!$.<br>

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




