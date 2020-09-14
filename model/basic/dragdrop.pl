extends = /model/basic.pl

radio =: RadioGroup
radio.decorator = CustomRadio

title =


headerbefore ==
labels = []
for content in labelscontent.splitlines():
    labels.append(CustomDragDrop.Label(content=content))

==

labelscontent ==
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

