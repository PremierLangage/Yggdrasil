

# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]
extends = /gift/templates/qselectset.pl

general_feedback = " Merci pour votre réponse." 
horizontal % false


title = Evaluation question

text  ==
(mettre à vide après)  
Enoncé de la question  
Réponse de l'élève  

==


form==
<p>Question(s) à choix multiples (1 seule réponse sélectionnable)</p>
<input type="radio" id="form_copie_blanche" name="f_evaluation" value="copie_blanche">
<label for="copie_blanche">Copie blanche</label><br>
<input type="radio" id="form_insuffisant" name="f_evaluation" value="insuffisant">
<label for="insuffisant">Insuffisant</label><br>
<input type="radio" id="form_passable" name="f_evaluation" value="passable">
<label for="passable">Passable</label><br>
<input type="radio" id="form_bien" name="f_evaluation" value="bien">
<label for="bien">Bien</label><br>
<input type="radio" id="form_tres_bien" name="f_evaluation" value="tres_bien">
<label for="tres_bien">Très bien</label><br>

<input type="text" id="form_pouet" name="fname">
</br></br>
<p>Explication de la note :</p>
<textarea id="form_pouet2" name="Explication" cols=100% rows="5">
</textarea>
==


before==
==


evaluator==#|python|
feedback = "J'ai bien lu votre formulaire " + response['pouet'] + " " + response['pouet2']
note = 100
grade = (note, feedback)
==




