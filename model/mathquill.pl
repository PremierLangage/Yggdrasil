extends = /model/math/math.pl

jinja_keys % ["text", "solution"]

title = 

text = 

form ==
{{ttt}}
<p>Réponse : <span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p>
<input type="text" id="form_math"><br>
<script>
mathField.latex("coucouc");
</script>
==

extrajs ==
<script>
    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if "reroll" in internals.buttons %}
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% endif %}
        
        {% if not "submit" in internals.buttons %}
        actions.find('.action-submit').hide();
        {% endif %}
    }
</script>

==

settings.feedback = rightwrong

settings.maxattempt % 1

evaluator ==
score, error = eval_expr(response['answer'], sol)
feedback = message[error]
==

