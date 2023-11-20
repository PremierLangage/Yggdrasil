




extends=/ComputerScience/C/template/std_progC17_clang.pl

@ parsecode.py 

editor.code==
/* votre code */

==

form= @/ComputerScience/python/form/text_editor.html

beforeA==
from parsecode import splitcode,splitwithre

keys = ""


for k,v in splitwithre("sujet.c").items():
    keys += " "+ str(k)
    globals()[k]=v

if "aleacode" in globals():
    eval(aleacode)
    text = text % globals()
    solution = solution % globals()

# raise Exception(keys)

editor['code']= "cac boudin" 

==

