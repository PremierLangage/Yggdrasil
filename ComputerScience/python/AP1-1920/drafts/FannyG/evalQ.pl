# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

general_feedback = " Merci pour votre réponse." 

title = Evalutation question

text  ==
Enonce de la question  
Réponse de l'élève  
Question(s) à choix multiples (1 seule réponse sélectionnable)  
Explication de la note dans inputbox
==


form==
<textarea id="form_pouet" name="Explication" cols=100% rows="5">
</textarea>
==


before= 

evaluator==#|python|
feedback = "J'ai bien lu votre formulaire " + response['pouet']
note = 100
grade = (note, feedback)
==


