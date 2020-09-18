extends = /model/basic.pl

text ==
Quelle est la capitale {{du_pays}} ?
==

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==
if input.value.casefold() == sol.casefold():
    score = 100
else:
    score = 0
==
