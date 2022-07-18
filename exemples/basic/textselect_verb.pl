extends = /model/basic.pl

title = Repérage des verbes

text ==
Identifier le ou les verbes conjugués la phrase ci-dessous.
==

form==
{{ txtsel|component}}
==


sentences ==
Quand Béfort {{vit}} Pierre au coin, il {{fut}} plus malheureux que lui.
{{Viens}} avec moi, j’{{ai}} besoin de toi !
Le chien {{aboya}} et les vaches {{partirent}} dans la bonne direction.
{{Pars}} vite, {{emmène}} le chien avec toi, il t’{{aidera}} !
==

txtsel =: Text
#txtsel.debug % true
txtsel.decorator = CustomTextSelect

before ==
import random as rd
sentence = rd.choice(sentences.splitlines())
txtsel.setdata_from_text(sentence)
==


evaluator ==
score = txtsel.eval()
==






