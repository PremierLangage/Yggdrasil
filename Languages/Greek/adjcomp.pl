@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Grec ancien

text ==
Identifier les adjectifs comparatifs dans le texte ci-dessous.
==

selectable =: Text
selectable.text== 
Δαρείου καὶ Παρυσάτιδος γίγνονται παῖδες δύο, πρεσβύτερος μὲν Ἀρταξέρξης, νεώτερος δὲ Κῦρος· ἐπεὶ δὲ ἠσθένει Δαρεῖος καὶ ὑπώπτευε τελευτὴν τοῦ βίου, ἐβούλετο τὼ παῖδε ἀμφοτέρω παρεῖναι.
==
selectable.selectable % true

before==
==

form==
{{ selectable|component}}
==

evaluator==

rightwords = ['πρεσβύτερος', 'νεώτερος']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in rightwords:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == 10 and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les adjectifs comparatifs !</span>'
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


