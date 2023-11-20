




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





if "aleacode" in globals():
    cc=compile(aleacode, " Code alea du fichier c","exec")
    exec(cc,globals())
    if "latexcode" not in globals():
        latexcode = "x^2+x^3+ax+bx+cx"
    text = text.format({"latexcode":latexcode})
    solution = solution % globals()

# raise Exception(keys)

code= "cac boudin" 

==

