extends = /model/basic/dropgroup.pl

title = Génétique

question ==
Compléter le texte suivante avec les bonnes étiquettes.
==

inputblock ==
<p> 
L’ensemble des gènes caractéristiques de l’espèce à laquelle appartient un organisme, constitue son {{ inputfield.drops[0]|component }}. 
Chez les individus d’une même espèce, un gène peut cependant exister sous différentes formes présentant de légères modifications de séquence : les allèles. 
L’ensemble des allèles d’un individu définit son {{ inputfield.drops[1]|html }}. Lorsqu’ils s’expriment, lors de la synthèse des protéines, les gènes participent à la construction de l’individu et à la mise en place de son {{ input.drops[2]|component }}. 
</p>

{% for label in inputfield.labels %} {{ label|html }} {% endfor %}
==

sol ==
génome
génotype
phénotype
==

labval ==
caryotype
==