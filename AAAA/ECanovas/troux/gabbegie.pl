extends = /model/math/expr.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

== 

before==

montexte="il était une fois une expression latex <br/>\n    //:MATHINPUT:=sqrt{3},-\sin{180},\\frac{1}{3^2}// à résoudre et toc.."
montexte=montexte+"<br/> et la suite //:MATHINPUT:=sqrt{9}//"

from loadexo import *

# du texte vers le dico des réponses/feedbacks et texte
enonc,dico,types = splitenonce(montexte)

# Mathinput FORM
mathiForm="Aucune entrée mathématique!!"
if types != []:
    mathiForm=getFormMathinput(enonc,types)

form=mathiForm

# premier item du dic : les bonnes solutions
lesSol="?"
if types != []:
    lesSol=types[1]
    lesSol=lesSol[1].split(',')

textsol=""
for sol in lesSol:
    if textsol=="":
        textsol=str(latex2sympy(sol))
    else:
        textsol=textsol+" ou "+str(latex2sympy(sol))

mathiForm=re.sub(r'[<,>]', '', mathiForm)
text=enonc+" et "+str(len(types))+ " et " +str(types) +" "+str(textsol)+"<br/>Form="+str(mathiForm)+" fin"

sol=""
==
extrajs ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
var mathField = MQ.MathField(mathFieldSpan, {
  charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha',
  autoOperatorNames: 'sin cos ln exp',
  handlers: {
    edit: function() { // useful event handlers
      latexSpan.value = mathField.latex(); // simple API
    }
  }
});
mathField.latex("{{ prev_value }}");

var mathFieldSpan2 = document.getElementById('math-field2');
var latexSpan2 = document.getElementById('form_math2');
var mathField2 = MQ.MathField(mathFieldSpan2, {
  charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha',
  autoOperatorNames: 'sin cos ln exp',
  handlers: {
    edit: function() { // useful event handlers
      latexSpan2.value = mathField2.latex(); // simple API
    }
  }
});
mathField2.latex("{{ prev_value }}");

</script>
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

    function onBeforeSubmitPL() {
    latexSpan.value = mathField.latex();
    return true;
}
</script>
==

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []

#evaluator ==
#from ast import literal_eval
#from sympy import sympify
#from latex2sympy import latex2sympy
#from evalsympy import eval_expr
#if lesSol == "?":
#   score=0
#   feedback = "Les solutions sont mal écrites!"
#else:
#    for sol in lesSol:
#        s=latex2sympy(sol)
#        score, error = eval_expr(answers['math'], s, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
#        if score==100:
#            break
#    if score !=100:
#        feedback = message[error]
#==

solution ==
La solution est $!{{ textsol|latex}}!$.
==

