



extends=/ComputerScience/C/template/std_progC17_clang.pl

@ parsecode.py 

editor.code==
/* votre code */

==


beforeZ==
from parsecode import splitcode

# splitcode("sujet.c")

for k,v in splitcode("sujet.c").items():
    globals()[k]=v


==

