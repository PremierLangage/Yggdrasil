# D. Doyen
# 7/3/2021
# complex numbers, affix, modulus, argument, complex plane, geometrical representation
# Placer dans le plan un point de module et d'argument donnés.

# Paramètres :
# - arguments : chaîne contenant une liste d'arguments au format SymPy

extends = /model/jxg/point.pl

title = Placer un point (argument/module)

attributes = {"showNavigation":False, "boundingbox":[-3.5,3.5,3.5,-3.5]}

tol = 0.2

pointname = "M"

param.arguments = "0, pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4, 2*pi"

before ==
modulus = randint(1, 3)
arg = choice(sympify(param['arguments']))
sol = ((modulus*cos(arg)).evalf(), (modulus*sin(arg)).evalf())
==

question ==
Placer le point $! M !$ dont l'affixe a pour module $! {{modulus}} !$ et  pour argument $! \displaystyle {{arg|latex}} !$ dans le plan complexe.
==

jxgscript == #|js|
board.create('grid',[],{gridX:0.5,gridY:0.5});
board.create('circle',[[0,0],1],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],2],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],3],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('axis', [[0, 0], [1, 0]], {name: 'Re', withLabel: true, label: {position:'urt', offset: [-5, 10]}, ticks:{visible: false}});
board.create('axis', [[0, 0], [0, 1]], {name: 'Im', withLabel: true, label: {position: 'urt', offset: [10, 0]}, ticks:{visible: false}});
var pt = board.create('point', [0, 0], {size: 2, name: 'M', color: 'blue'});
==

