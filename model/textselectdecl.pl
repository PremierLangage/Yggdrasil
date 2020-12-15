

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

#! linter:title:str
#! linter:text:
#!linter:textdelaselection:
#! linter:mots:
#! linter:cible:


text==
Dans le text suivant choisissez {{cible}}.

==
title=Choisir {{cible}}


selectable =: Text
selectable.selectable % true 



before==
import re
selectable.text=textdelaselection

matching=0
for m in textdelaselection.split(" "):
    if re.sub("\W+","",m).lower() in mots:
        matching += 1

==

form==
{{ selectable|component}}
==

evaluator==
import re
def cleanIt(s):
    return re.sub("\W+","",s)

found = 0
error = 0

for e in selectable.selections:
    clean = cleanIt( e['content'])
    if clean.lower() in mots:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == matching and error == 0:
    score = 100
    msg = f'<span class="success-state">Bravo, vous avez trouvé tous {cible} !</span>'
else:
    score = max([0, matching*(found - error)])
    nb_error = (matching - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'
    msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
grade = (score, msg)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==




