
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

#! linter:title:str

#! linter:text:
text=
title=



selectable =: Text

selectable.selectable % true

before==



selectable.text="bande de moule" 

==

form==
{{ selectable|component}}
==

evaluator==

mots = ['Toi', 'moi,', 'eux', 'lui', 'elle', 'je', 'on', 'On', 's\'']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in mots:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == 10 and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les pronoms personnels !</span>'
else:
    score = max([0, 10*(found - error)])
    nb_error = (10 - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'

grade = (score, msg)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==









