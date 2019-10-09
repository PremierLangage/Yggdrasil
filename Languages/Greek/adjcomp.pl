extends = /Languages/template/selectwords.pl

title = Grec ancien

text ==
Identifier les adjectifs comparatifs dans le texte ci-dessous.
==

form ==
{{input_1}}
==

input.1.type = selectwords

input.1.text = 
input.1.indexwords = 6,9

evaluator ==
from math import floor

sol = set(indexwords.split(","))
ans = set(answer['1'].split(","))

rightwords=ans.intersection(sol)
wrongwords=ans.difference(sol)
missedwords=sol.difference(ans)

nbright=len(rightwords)
nbwrong=len(wrongwords)
nbmissed=len(missedwords)

score=floor(nbright/(nbright+nbwrong+nbmissed)*100)

feedback="""<span style="color:green;">Mots corrects : {}</span><br>
<span style="color:red;">Mots incorrects : {}</span><br>
<span style="color:blue;">Mots oubliés : {}</span><br>
<span>Score : {}/100</span>""".format(nbright,nbwrong,nbmissed,score)

grade=(score,feedback)

formmode="correction"
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

verbes = ['πρεσβύτερος', 'νεώτερος']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in pronoms:
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


