



extends=/ComputerScience/C/template/std_progC.pl

@ parsecode.py 

@ exercice.c [source.c]


before==
from parsecode import splitcode

splitcode("source.c")

text += str(splitcode("source.c"))
==