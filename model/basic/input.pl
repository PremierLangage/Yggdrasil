extends = /model/basic.pl

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==
if isinstance(sol, str):
    if '\n' in sol:
        lstsol = sol.splitlines()
    else:
        lstsol = [sol]
else:
    lstsol = sol

if any([input.value.casefold() == item.casefold() for item in lstsol]):
    score = 100
else:
    score = 0
==
