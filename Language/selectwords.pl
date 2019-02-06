@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]
@ ./utilstext.py [utilstext.py]

title = Sélectionner des mots

before ==
from utilstext import swsplit
text0="""Δαρείου καὶ Παρυσάτιδος γίγνονται παῖδες δύο, πρεσβύτερος μὲν Ἀρταξέρξης, νεώτερος δὲ Κῦρος· ἐπεὶ δὲ ἠσθένει Δαρεῖος καὶ ὑπώπτευε τελευτὴν τοῦ βίου, ἐβούλετο τὼ παῖδε ἀμφοτέρω παρεῖναι."""
htmltextsplit=swsplit(text0)
sol =['6','9']
==

text ==
Identifier les adjectifs comparatifs dans le texte ci-dessous.
==

form=@ form_selectwords.html

evaluator ==
feeback=""
ans = response['answer'].split(",")
feedback=""
if set(sol)==set(ans):
    grade=(100,"Bonne réponse")
else:
    if len(set(sol)-set(ans))>0 :
        feedback += "Tu en a oublié !"
    if len(set(ans)-set(sol))> 0 :
        feedback += "Tu en a mis en trop !"
    grade=(0,feedback)
	
==




