### A finir

extends = editor.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 10

#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">Vous n'avez pas réussi l'exercice.<br> Relisez votre cours et retentez l'exercice un peu plus tard.</p>


#* override this key to change the text shown after a good answer.
form_success== #|html|
<p class="success-state">Bravo c'est une bonne réponse.</p>
==
