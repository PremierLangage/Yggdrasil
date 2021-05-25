extends = /model/basic/dragdrop.pl

title = Génétique

question ==
Compléter le texte suivante avec les bonnes étiquettes.
==

inputblock ==
<p> 
L’ensemble des gènes caractéristiques de l’espèce à laquelle appartient un organisme, constitue son {{ drops[0] }}. 
Chez les individus d’une même espèce, un gène peut cependant exister sous différentes formes présentant de légères modifications de séquence : les allèles. 
L’ensemble des allèles d’un individu définit son {{ drops[1] }}. Lorsqu’ils s’expriment, lors de la synthèse des protéines, les gènes participent à la construction de l’individu et à la mise en place de son {{ drops[2] }}. 
</p>

{% for label in labels %} {{ label }} {% endfor %}
==

sol ==
génome
génotype
phénotype
==

labval ==
caryotype
==