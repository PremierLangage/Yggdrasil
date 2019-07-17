


author=DR

title= Premiers pas de programmation d'un exercice PL 

text==

Un exercice PL est un fichier texte contenant des définition de couples clef,valeur.

Dans l'éditeur si dessous nous vous proposons de créer votre premier couple clef valeur 
en définisant le titre de votre exercice.

Ecrivez dans l'éditeur la ligne :
```
title= Le titre que vous souhaiter pour votre éxercice.
```

==


form=@/form/text_editor.html

editor.id=student
editor.height=80 # 5 lignes font normal






@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

evaluator==
content= response['student']
if "title=" in content or "title =" in content :
    grade=(100, " bravo vous avez défini un titre, passez à l'exercice suivant.")
else:
    grade=(0,' <p style="color:red"> essayez avec la ligne title=Mon titre </p>')

==


