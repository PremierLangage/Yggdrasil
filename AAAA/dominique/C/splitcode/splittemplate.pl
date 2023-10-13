



extends=/ComputerScience/C/template/std_progC17_clang.pl

@ parsecode.py 

editor.code==
/* votre code */

==


beforeA==
from parsecode import splitcode

keys = splitcode("sujet.c").keys()

for k,v in splitcode("sujet.c").items():
    globals()[k]=v



raise Exception(str(keys))


==

