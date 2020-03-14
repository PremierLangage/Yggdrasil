extends = math.pl

radio =: RadioGroup
# Les deux lignes suivantes sont temporaires.
@ /utils/components/radio.py [customradio.py]
radio.decorator = CustomRadio

settings.feeedback = raw

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==
