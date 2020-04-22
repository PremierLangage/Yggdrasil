### A finir

extends = editor.pl

#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">Vous n'avez pas réussi l'exercice. Relisez votre cours et retentez l'exercice un peu plus tard.</p>


#* override this key to change the text shown after a good answer.
form_success== #|html|
<p class="success-state">Bravo c'est une bonne réponse.</p>
==


#* override this key to change the text shown after a good answer.
form_success== #|html|
<p class="success-state">Bravo l'automate que vous avez construit est une bonne réponse.</p>
== 

