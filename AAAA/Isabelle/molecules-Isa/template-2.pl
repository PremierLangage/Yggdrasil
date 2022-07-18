#inclusion de fichiers
@/utils/sandboxio.py
@/Chemistry/utils/loader.py

# le grader est pour évaluer l'exercice
grader=@/grader/evaluator.py
# le builder est pour construire l'enoncer et l'interface de reponse
builder=@/builder/before.py
delimiter=;
dimension=120

# on donne un titre
title = Exercice de chimie orga
text=

style=@template.css
script=@template.js

before==
import loader

==

# form donnne le formulaire de réponse qu'on veut utiliser
#form==
#<input type="text" name="form_answer" >
#==
# ici, on va utiliser le formulaire décrit dans template.html
form=@template.html









