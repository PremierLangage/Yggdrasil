extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le ou les verbes conjugués la phrase ci-dessous.
==

form==
{{ select|component }}
==


select =: Text
select.decorator = CustomTextSelect

before ==
import random as rd
sentence = rd.choice(sentences.splitlines())
select.setdata_from_text(sentence)
==

evaluator ==
score = select.eval()
==

