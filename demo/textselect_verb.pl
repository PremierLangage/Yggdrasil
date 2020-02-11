@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

selectable =: Text
selectable.text== 
Artur a horreur de la marche à pied.
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

comptest ==
 <script>
var string = "{L}'{élève} {n}'{a} {pas} {fait} {son} {travail}.";
var index = -1;
string=string.replace(/\{([^\{\}]*)\}/g, function(match,p) {
  index++;
  return `<span data-index="${index}">${p}</span>`;
});
alert(string);
</script>
==

