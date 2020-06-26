# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]
extends = /gift/templates/qselectset.pl

general_feedback = " Merci pour votre réponse." 

title = Evaluation question

text  ==
(mettre à vide après)  
Enonce de la question  
Réponse de l'élève  
Question(s) à choix multiples (1 seule réponse sélectionnable)  
==

form==
<input type="text" id="form_pouet" name="fname">
</br></br>
<p>Explication de la note :</p>
<textarea id="form_pouet2" name="Explication" cols=100% rows="5">
</textarea>
==


before= 

evaluator==#|python|
feedback = "J'ai bien lu votre formulaire " + response['pouet'] + " " + response['pouet2']
note = 100
grade = (note, feedback)
==


