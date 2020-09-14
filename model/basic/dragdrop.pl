extends = /model/basic.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if labelscontent in locals():
    list_labelcontents = labelscontent.splitlines()
else:
    list_labelcontents = list(set(dropsol.splitlines()))

for content in list_labelcontents:
    labels.append(CustomDragDrop.Label(content=content))

==

dropsol ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

text =

form ==
{% for label in labels %}
{{ label|component }}
{% endfor %}
==

