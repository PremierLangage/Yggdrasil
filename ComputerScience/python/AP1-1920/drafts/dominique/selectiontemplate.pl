
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

#! linter:title:str

#! linter:text:
#! linter:textdelaselection:

text= Choisir les pronoms 
title=


selectable =: Text

selectable.selectable % true
selectable.mode = word

mots = ['Toi', 'moi,', 'eux', 'lui', 'elle', 'je', 'on', 'On', 's\'']


textdelaselection==
Toi plus moi, plus eux plus tous ceux qui le veulent. 
Plus lui plus elle plus tous ceux qui sont seuls. 




Allez venez et entrez dans la danse. 
Allez venez, laissez faire l'insouciance. 
A deux a mille je sais qu' on est capable. 
Tout est possible tout est réalisable. 
On peut s' enfuir bien plus haut que nos rêves. 
On peut partir bien plus loin que la grève. 
==

separator ==
\t.,; :!?
==


before==

selectable.separator = separator
selectable.text=textdelaselection

matching=0
for m in textdelaselection.split(separator):
    if m in mots:
        matching += 1

==

form==
{{ selectable|component}}
==

evaluator==

found = 0
error = 0

for e in selectable.selections:
    if e['content'] in mots:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == matching and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les pronoms personnels !</span>'
else:
    score = max([0, matching*(found - error)])
    nb_error = (matching - found) + error
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










