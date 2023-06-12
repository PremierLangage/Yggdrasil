


# un excercice de python avec un editeur un before et une evaluation a la main.
extends = /AAAA/dominique/python/template/pltest2023.pl

title= Variable 

text== 

Définissez une variable **{{name}}** contenant la constante **{{constante}}**. 

Dans la variable **{{nameZ}}** mettez la somme des variables **{{nameX}}** et **{{nameY}}**.

==


before==
import random
import ast 
name = random.choice(["un","A","X","var","name","fun","foo","bar"])
nameX = random.choice(["un","A","X","var","name","fun","foo","bar"])+"X"
nameY = random.choice(["un","A","X","var","name","fun","foo","bar"])+"Y"
nameZ = random.choice(["un","A","X","var","name","fun","sum","add"])+"Z"
globals()[nameX] = random.randint(5,1000)
globals()[nameY] = random.randint(5,1000)
globals()[nameZ]= globals()[nameX]+globals()[nameY]


constante= random.choice([ast.literal_eval(x) for x in ["66","'@'",'"space-Y"',"0","-1","33.55","True","False"]])

pltest=f"""
>>> {{name}}=={{constante}}
True
"""

pltest1=f"""
>>> {{nameZ}}=={{nameX}}+{{nameY}}
True
"""

==

