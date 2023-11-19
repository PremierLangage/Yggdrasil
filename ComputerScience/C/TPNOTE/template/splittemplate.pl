




extends=/ComputerScience/C/template/std_progC17_clang.pl

@ parsecode.py 

editor.code==
/* votre code */

==


beforeA==
from parsecode import splitcode,splitwithre

keys = ""


for k,v in splitwithre("sujet.c").items():
    keys += " "+ str(k)
    globals()[k]=v



 raise Exception(keys)


==

