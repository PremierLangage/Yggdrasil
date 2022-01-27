extends = /model/math/expr.pl

before ==
import scipy
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt

import numpy as np
from scipy import interpolate

x = [0, 1, 9]
y = [-1, 3, 4]
f = interpolate.PchipInterpolator(x, y)

xnew = np.arange(0,9,0.1)
import matplotlib.pyplot as plt

var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
f = (x-2)**2 + 1
sol =  0
n = 3
plt.clf()
plt.xlim(-n, n)
plt.grid(True)
plt.xticks(range(-n, n+1))
plt.yticks(range(-10, 10, 2))
plt.plot(x,y,'',xnew,f(xnew),'-')
image = fig2svg(plt.gcf())
==

question ==
{{t}} {{s}}
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==
