

extends=first.pl

title= Récupérer et évaluer la réponse de l'étudiant 

text==

Nous avons dans l'exercice précédent utilisé le formulaire standard "simplenumeric.html" nous verrons un peu plus loing comment accepter d'autre formats.

Voici le contenu de ce formulaire il permet de récuperer un "number" dans une variable **response['txt_answer']**,
car l'id de l'input est "form_txt_answer".  


&lt; input id="form_**txt_answer**" type="number" class="form-control" placeholder="" required>


pour le moment nous allons simplement nous préoccuper de l'évaluation de la réponse de l'étudiant.

Si vous voulez changer le nom de la variable optenu pour **rep_student** . 

il faut écrire 
&lt; input id="form_**rep_student**" type="number" class="form-control" placeholder="" required>

Regardons comment évaluer cette réponse de l'etudiant 

# Evaluer l'exercice

Pour cela nous allons écire  un **evaluator** qui permet d'évaluer
 l'exercice c'est à dire vérifier la réposne de l'étudiant. 
il est nécessaire d'ajouter la ligne suivant :  
```
grader=@ /grader/evaluator.py 
```
qui peut aussi s'écrire :
```
@ lib:/grader/evaluator.py [grader.py] 
```
Ces lignes indiquent que le grader standard défini dans librairie standard doit être utilisé (ce qui nous évite d'avoir à l'écrire).

# L'evaluator
Le grader standard cherche dans l'éxercice une clef **evaluator**.
Cette clef est du code python que l'on excute pour __évaluer__ les réponses de l'étudiant.

Pour cela nous avons besoin de programmer 'en python' cette clef evaluator
Trois étapes :
- récupérer la réponse 
- évaluer la réponse 
- produire la note et le feedback qui sera retourné à l'étudiant.

L'exemple suivant 


<code>
 evaluator==
 somme = int(response['txt_answer']) # conversion de la chaine en int 
 if somme == 8 : # la bonne réponse 
    grade=(100, "BRAVO Bravo c'est exact ") # évaluation maximale, et un feedback textuel 
 else:
    grade=(0, "ECHEC non ce n'est pas cela. hint: les chaises et les tables ont le même nombre de pieds, et c'est une multiple de 4.")
 ==
</code>


Vous avez remarquez que l'on positionne la variable **grade** pour transmettre l'évaluation de l'exercice.
(rem: nous ne pouvons pas faire return ]

**Attention** conservez BRAVO et ECHEC dans vos feedback pour que votre exercice soit correctement évalué.

==

@ ./parsefortuto.py
@ ./exceptions.py

editor.height=200

editor.code==
title= Un calcul entier 
text=Ajouter le nombre de pieds d'une chaise et le nombre de pied d'une table. 
form=@ /form/simplenumeric.html
grader=@ /grader/evaluator.py 

==



evaluator==
import parsefortuto as ps

d,w = ps.parse_file(response['student'])
# Faire un test resussite avec txt_answer=8 
# test echec avec txt_answer = 13
#  ok maintenant il faut une view pour valider l'exercice 

if w :
        grade=(0, "<p style='color:red;'> reglez l'erreur de prorgammation </p> <br/>"+" ".join(w) )
else:
    # appeler la preview dans une partie de la fenetre 
    grade= (100,"<p style='color:green;font-size:24px'> parfait vous avez ecrit un exercice calulatoire simple  </p>")

==



