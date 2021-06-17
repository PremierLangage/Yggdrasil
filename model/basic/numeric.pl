extends = /model/basic/basic.pl


input =: Input
input.type = number

inputblock ==
{{ input|component }}
==


evaluator ==
if input.value == sol:
    score = 100
else:
    score = 0
==