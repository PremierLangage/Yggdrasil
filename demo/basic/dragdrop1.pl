extends = /model/basic/dragdrop.pl

title ==
Exemple 3
==

labelcontents ==
habes
habet
habent
==

dropsol ==
habet
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Pastor pecuniam non {{ drops[0]|component }}.<br>


{% for label in labels %}
{{ label|component }}
{% endfor %}
==

