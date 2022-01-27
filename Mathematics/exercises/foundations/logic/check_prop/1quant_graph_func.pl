extends = /model/math/expr.pl

before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt

import numpy as np
from scipy import interpolate

x = [0, 1, 9]
y = [-1, 3, 4]
f = interpolate.PchipInterpolator(x, y)

xnew = np.arange(0,9,0.1)

plt.plot(xnew,f(xnew))
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
