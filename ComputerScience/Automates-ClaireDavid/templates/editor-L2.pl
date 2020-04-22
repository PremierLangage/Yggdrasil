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

show_soluce = 'True'

form== #|html|
<!-- TIMEOUT VIEW -->
{% if attempt >= maxattempt and show_soluce = 'True'%}
{{ viewer|component }}
{% endif %}

<!-- SUCCESS VIEW -->
{% if score == 100  %}
{{ form_success }}
{% endif %}

<!-- EDITOR VIEW -->
{{ editor|component }}

<br>

<!-- INSTRUCTIONS VIEW -->
{{ form_instructions }}

<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button
        // hide submit button if needed.
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);
    }
</script>
==
