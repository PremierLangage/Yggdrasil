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
<!--
{% if not deterministic %}
    <p class="success-state">L'automate déterministe suivant était aussi une bonne réponse :</p>
    {{ viewer|component }}
{% endif %}
-->
== 

#* override this key to change the instructions at the bottom of the editor.
form_instructions== #|html|
<p>
    <ul>
        <li> Pour créer un nouvel état, double clic gauche. Utilisez les boutons pour changer le type de votre état.<br>
            <i> Ne pas renommer les états - il y a un bug</i>
        </li>
        <li>
        Pour ajouter une transition cliquer sur le point orange de l'état de départ
        et tirer votre transition jusqu'à l'état d'arrivée.
        Pour ajuster la lettre étiquettant de la transition, cliquer sur l'étiquette et choisir "changer transition".
        </li>
    </ul>
</p>
==
