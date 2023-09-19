



extends=/ComputerScience/C/template/std_progC.pl

@ parsecode.py 

@ exercice.c [sujet.c]


beforeZ==
from parsecode import splitcode

title = "beforeZ"

text += str(splitcode("sujet.c"))

for k,v in splitcode("sujet.c").items():
    globals()[key]=v
==


before01==
from parsecode import splitcode


title = "Prout"

for k,v in splitcode("source.c").items():
    globals()[key]=v
==