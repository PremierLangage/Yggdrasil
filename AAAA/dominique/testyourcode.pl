
extends= /model/progpython.pl

title=
text= Exécuter votre code sur la sandbox 

inputbox =: Input
inputbox.type = multiline
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 2
inputbox.appearance = outline

Ans= Entree du programme

editor.code = Votre code 

form==
{{ inputbox | component }}
{{editor|component}}
==
