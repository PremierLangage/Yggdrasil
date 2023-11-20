




extends=/ComputerScience/C/template/std_progC17_clang.pl

@ parsecode.py 

editor.code==
/* votre code */

==



before_splitcode==
from parsecode import splitcode,splitwithre

keys = ""


for k,v in splitwithre("sujet.c").items():
    keys += " "+ str(k)
    globals()[k]=v

text += latexcode
text += pcode



if "aleacode" in globals():
    r=compile(aleacode, " Code alea du fichier c","exec")
    exec(r,globals())

    text = text.format({"latexcode":latexcode})
    solution = solution % globals()

# raise Exception(keys)

code= "cac boudin" 

==

