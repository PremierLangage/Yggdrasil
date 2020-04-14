############### A FINIR #########################
extends = exo-egalite-auto.pl


maxattempt = 5

generate== #|py|
## Ajouter ici la génération:
#    la construction de l'automate pour tester la réponse

# peut-on utiliser la syntaxe du viewer ?
==

title = Exemples de langages
text ==
Donnez l'automate minimal déterministe complet correspondant au langage reconnu par cet automate. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==










