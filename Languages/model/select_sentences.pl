extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le ou les verbes conjugués la phrase ci-dessous.
==

form==
{{ select|component }}
==

settings.feedback = lightscore

select =: Text
select.decorator = CustomTextSelect
select.typo = subheading1

before ==
import random as rd
sentence = rd.choice(sentences.splitlines())
select.setdata_from_text(sentence)
==

evaluator ==
score = select.eval()
==

