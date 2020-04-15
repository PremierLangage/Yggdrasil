############### A FINIR #########################
extends = editor.pl


maxattempt = 5

mk_auto == #|python|
#pour ajouter une transition à l'automate
#viewer.automaton+="""
#s0:a>s2"""
==

# le fichier autretomate aura comme nom tomate.py
# il sera pris à place de tomate.py
@autretomate.py [tomate.py]


generate== #|py|
## Ajouter ici la génération:
#    la construction de l'automate pour tester la réponse

# peut-on utiliser la syntaxe du viewer ?
==

title = Exemples de langages
text ==
{{ viewer|component }}
Donnez l'automate minimal déterministe complet correspondant au langage reconnu par cet automate. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==










