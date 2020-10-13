
extends= /model/progpython.pl


inputbox =: Input
inputbox.type = multiline
inputbox.placeholder = Ans
inputbox.maxlength = 2
inputbox.appearance = outline

Ans= Entree du programme

form==
{{ inputbox | component }}
{{editor|component}}
==
