@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]
@ utilstext.py 


before ==
from utilstext import swsplit
htmltextselect=swsplit(textselect)
formmode="input"
==

form=@ form_selectwords.html

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


