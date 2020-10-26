extends = /model/basic/dragdrop.pl

title ==
Exemple 1
==

labelcontents ==
habes
habet
habent
==

solutions ==
habet
==

text ==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Pastor pecuniam non {{ drops[0]|component }}.



{% for label in labels %}
{{ label|component }}
{% endfor %}
==



