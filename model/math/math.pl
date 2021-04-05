@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib.py

@ /model/serialization/JSONEncoder.py [json_encoder.py]
@ /model/jinja_env/jinja_env_math.pl [jinja_env.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/plrandom.py

headerbefore ==
import random as rd
from random import choice, sample
from plrandom import randint
from randsympy import randint_complex, randint_poly
from sympy2latex import latex
from sympy import var, symbols, Symbol
from sympy import E, I, pi
from sympy import sqrt, sin, cos, tan, exp, ln
from sympy import FiniteSet, Intersection, ProductSet
from sympy import Integer, Rational, Eq
==

# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
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