extends = /model/basic.pl

title = Addition

before ==
a = 10
s = ""
colors = ["Red", "Blue", "Yellow"]
==

text ==
a: {{ a }}

s: {{ s }}
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==



