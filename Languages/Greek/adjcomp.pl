extends = /Languages/template/selectwords.pl

title = Grec ancien

text ==
Identifier les adjectifs comparatifs dans le texte ci-dessous.
==

form ==
{{input_1}}
==

input.1.type = selectwords

input.1.text = Δαρείου καὶ Παρυσάτιδος γίγνονται παῖδες δύο, πρεσβύτερος μὲν Ἀρταξέρξης, νεώτερος δὲ Κῦρος· ἐπεὶ δὲ ἠσθένει Δαρεῖος καὶ ὑπώπτευε τελευτὴν τοῦ βίου, ἐβούλετο τὼ παῖδε ἀμφοτέρω παρεῖναι.

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




