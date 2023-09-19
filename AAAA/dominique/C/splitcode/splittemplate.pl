



extends=/ComputerScience/C/template/std_progC.pl

@ parsecode.py 

@ exercice.c [source.c]


beforeA==
from parsecode import splitcode



text += str(splitcode("source.c"))

for k,v in splitcode("source.c").items():
    globals()[key]=v
==