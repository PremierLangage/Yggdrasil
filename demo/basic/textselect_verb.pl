@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

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
txtsel.loadtext("{{Artur}} a {{horreur}} de la marche à pied.")
==


evaluator ==
grade = txtsel.eval()
txtsel.disabled = True
==



