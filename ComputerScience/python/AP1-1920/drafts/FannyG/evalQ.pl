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
Question(s) à choix multiples (1 seule réponse sélectionnable)  
==

choices==
=Copie blanche
=Insuffisant
=Passable
=Bien
=Très bien
==

form==
<form>
  <p>Question(s) à choix multiples (1 seule réponse sélectionnable)</p>
  <input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</label><br>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</label><br>
  <input type="radio" id="other" name="gender" value="other">
  <label for="other">Other</label>
</form>

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





