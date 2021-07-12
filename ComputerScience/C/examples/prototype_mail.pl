#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse ici
inputbox.appearance = outline

before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Prototype d'exercice pour candidat
==

text==#|markdown|
<script src="https://smtpjs.com/v3/smtp.js">
</script>
<script type="text/javascript"> 
function sendEmail(corps_mess) {
Email.send({
    SecureToken : "4cc0b2e5-50be-4795-ab9f-35c732219df3",
    To : 'nicolas.borie@univ-eiffel.fr',
    From : "PLaTon@univ-eiffel.fr",
    Subject : "Votre candidat a terminé un exercice sur PLaTon",
    Body : corps_mess,
}).then(
  message => alert(message)
);
}
</script>

Ceci est un prototype d'exo qui est cencé envoyé un résumé mail de l'exercice à une personne 
définie en dur dans le code source de l'exercice.
==


form==#|markdown|
<b>Qu'avez vous envie de nous dire ?</b>

<br><br>

{{ inputbox|component}}
==


evaluator==#|python|
form = "Nickel, vous avez bien terminé votre questionnaire. Finalisez cela en cliquant sur le bouton qui suit"

grade = (100, '<input type="button" value="Send Email" onclick="sendEmail("'+inputbox.value+'")">')
==

