

author=dr

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = <div style="color: {{thecolor}};"> Vive les couleurs {{essai}} - {{color}} </div>

before==
essai=0
thecolor="black"
==

text ==

Le titre change de couleur 

==

form =

evaluator ==
import random
colors=["blue","red","green","yellow","pink","orange"]
color=random.randint(1,len(colors))-1
thecolor=colors[color]
essai=essai+1
grade=(essai*essai,"  ")
==






