extends = /model/math.pl

title = Démo JSXGraph

# Le composant sera bientôôt renommé JSXGraph
jxg =: MathDrawer
# Le décorateur est temporaire.
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation": false, "boundingbox": [-6, 6, 6, -6]}

settings.feedback = Raw
settings.maxattempt % null

before ==
jxg.setscript(script_init)
==

script_init ==
var ptA = board.create('point', [-2,2], {size: 2, name: 'A', color: 'red'});
var ptB = board.create('point', [1,1], {size: 2, name: 'B', color: 'blue'});
var ptC = board.create('point', [0,0], {size: 2, name: 'C', color: 'blue'});
var line = board.create('line', [ptB, ptC]);
==

text ==
Déplacer les points puis cliquer sur le bouton **Valider** pour obtenir leurs coordonnées.
==

form ==
{{ jxg|component }}
==

evaluator ==
score = 100
feedback = ', '.join([name + ' : '+ str(jxg.getpoint(name)) for name in ['A', 'B', 'C']])
==
