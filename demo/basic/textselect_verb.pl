extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

form==
{{ txtsel|component}}
==


txtsel =: Text
txtsel.decorator = CustomTextSelect

before ==
txtsel.settext("{{Artur}} a {{horreur}} de la marche à pied.")
==


evaluator ==
#grade = txtsel.eval()
grade=(100, str(txtsel.selections))
txtsel.disabled = True
==




