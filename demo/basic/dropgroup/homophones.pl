extends = /model/basic/dropgroup.pl

title= DragDrop


question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

sol ==
ces
c'est
ces
==

inputblock == #|html|
* Je voudrais {{ inputfield.drops[0]|html }} chausures pour mon anniversaire.
* Tu est toujours en retard, {{ inputfield.drops[1]|html }} agaçant !
* Je n'aime pas {{ inputfield.drops[2]|html }} méthodes.

{% for label in inputfield.labels %} {{ label|html }} {% endfor %}
==