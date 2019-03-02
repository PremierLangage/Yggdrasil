#inclusion de fichiers
@/utils/sandboxio.py
@template.py

grader=@/grader/evaluator.py
builder=@/builder/before.py

delimiter=;
moleculeSize=120
requiredMessage=Vous devez dessiner une molécule !
textButton=Ajouter
before==#|py|
import template

if not 'path' in locals() :
    raise Exception("'path' key is required")

exercice = template.get(path, delimiter)
for k in exercice:
    globals()[k] = exercice[k]
==

form=@template.html




