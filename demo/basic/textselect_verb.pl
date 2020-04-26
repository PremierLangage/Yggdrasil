extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

form==
{{ txtsel|component}}
==


txtsel =: Text
txtsel.debug % true
txtsel.decorator = CustomTextSelect

before ==
txtsel.setdata_from_text("{{Artur}} a {{horreur}} de la marche à pied.")
==


evaluator ==
score = txtsel.eval()
#grade=(100, str(txtsel.selections))
txtsel.disabled = True
==






