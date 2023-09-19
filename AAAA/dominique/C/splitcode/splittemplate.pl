



extends=/ComputerScience/C/template/std_progC.pl

@ parsecode.py 

@ exercice.c [sujet.c]


beforeZ==
from parsecode import splitcode

title = "beforeZ"

for k,v in splitcode("sujet.c").items():
    globals()[k]=v
==

