
extends= /model/progpython.pl
extends= /ComputerScience/python/AP1-1920/templates/prosoluce.pl


title=
text= Exécuter votre code sur la sandbox 

inputbox =: Input
inputbox.type = multiline
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 2
inputbox.appearance = outline

editor.code = Votre code du projet




form==
{{ inputbox | component }}
{{editor|component}}
==


