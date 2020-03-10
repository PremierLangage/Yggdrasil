extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

form==
{{ txtsel|component}}
==


txtsel =: Text
@ /utils/components/textselect.py [customtextselect.py]
txtsel.decorator = CustomTextSelect

before ==
txtsel.settext("{{Artur}} a {{horreur}} de la marche à pied.")
==


evaluator ==
grade = txtsel.eval()
txtsel.disabled = True
==




