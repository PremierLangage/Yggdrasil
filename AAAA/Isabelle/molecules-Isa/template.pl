#inclusion de fichiers
@/utils/sandboxio.py
@../../utils/loader.py

grader=@/grader/evaluator.py
builder=@/builder/before.py
delimiter=;
dimension=120

title =
text=

style=@template.css
script=@template.js

before==
import loader

if not 'path' in locals() :
    raise Exception("'path' key is required")

exercice = loader.get(path, delimiter)
for k in exercice:
    globals()[k] = exercice[k]

expected = [] 
__counter__ = 1
while True:
    k = 'produit'+str(__counter__)
    if k in exercice:
        v = exercice[k]
        if v:
            expected.append(v)
    else:
        break
    __counter__ += 1
==

form=@template.html









