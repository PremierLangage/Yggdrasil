


# un excercice de python avec un editeur un before et une evaluation a la main.

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html


title= Variable 

text== 

Déclarez une variable **{{name}}** contenant la constante **{{constante}}**. 

Ajouter à la variable **{{nameZ}}** le contenu des variables **{{nameX}}** et **{{nameY}}**.

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



==

evaluator== 

==
