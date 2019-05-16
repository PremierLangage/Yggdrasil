extends=first.pl

title= un calcul

text==
Bien entendu la réponse est un entier nous allons fournir un champs de réponse entier.
Pour cela nous allons utiliser un formulaire prédéfini de la librairie standard.

Utilisont une nouvelle syntaxe:

```
    form=@ /form/simplenumeric.html  
```

le symbol @ indique que ce qui suit est un nom de fichier.   
ici =@ permet d'initialiser la clef form avec le contenu du fichier.

==

@ ./parsefortuto.py
@ ./exceptions.py

editor.height=200

editor.code==
title= Un calcul entier 
text=Ajouter le nombre de pieds d'une chaise et le nombre de pied d'une table. hint: les chaises et les tables ont le même nombre de pieds, et c'est une multiple de 4.

==



evaluator==
import parsefortuto as ps

d,w = ps.parse_file(response['student'])
ok=True
for x in ['text','title','form']:
    if x not in d:
        ok=False
        grade=(0, "<p style='color:red;'> il manque la clef "+x+"</p> <br/>"+" ".join(w) )
if ok:
       grade= (100,"<p style='color:green;font-size:24px'> parfait vous avez un titre,  un énoncé, un formulaire </p>")

==

