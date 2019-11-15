

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =liste vers mot
text== 
La méthode 'join' reçoit une chaine de caractère *separateur* et un itérable (ici une liste) formé de chaines de caratères. Elle renvoie une nouvelle chaine formée des chaines de caractères de la liste séparées per la chaine *separateur*.
<br>
Exemples:<br>
"3".join(['toto','titi','tata']) renvoie 'toto3titi3tata'<br>
"TTT".join(["r","y","gh"]) renvoie 'rTTTyTTTgh'<br>
"TTT".join([]) renvoie ''

Ecrire une fonction `relie` qui simule ce fontionnement.
==
before==
def relie(sep,lst):
    m=''
    for i in range(len(lst)):
      m+=lst[i]  
        if i!= len(lst)-1:
            m+=sep
    return m    
import random
lst=['to','unvelo','bla','abcdefghij','import','mot','permutations','toto','titi','tata','circulaires']

sep=['3','#',' ','long']
lg=random.randint(1,5)
s= random.choice(sep)
m=[]
for i in range(lg):
    m.append(random.choice(lst))

pltest3=""">>> relie({},{})\n{}""".format(s,m,relie(s,m))


after=before

==
pltest1==
>>> relie(" ",['a','b','c']=='a b c'
True
==
