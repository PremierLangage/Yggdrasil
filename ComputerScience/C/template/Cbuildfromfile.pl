
extends=stdsandboxC.pl 

# fichier contenant une solution 
# doit contenir deux lignes /* cut */ 
# pour savoir quelle partie est avant 
# quelle partie est après 

@ source.c [source.c] 

before=

with open("source.c","r" as f :
    lines = f.read()
try:
    codebefore, solution, codeafter = lines.split("\n/* cut */\n")
except :
    import sys
    print("Le fichier source.c ne contient pas les deux lignes /* cut */ ", file=sys.err)
    exit(-1)

==
