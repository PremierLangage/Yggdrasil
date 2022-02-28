extends = /model/basic/dropgroup.pl

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

sol ==
ces
c'est
ces
==

inputblock == #|html|
* Je voudrais {{ input.drops[0]|component }} chausures pour mon anniversaire.
* Tu est toujours en retard, {{ input.drops[1]|component }} agaçant !
* Je n'aime pas {{ input.drops[2]|component }} méthodes.


{% for label in input.labels %} {{ label|component }} {% endfor %}
==