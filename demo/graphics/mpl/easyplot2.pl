extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot
from sympy import cos, pi, Symbol

x = Symbol('x')
expr = 1 + cos(pi*x)
easyplot(plt.gcf(), expr, 0, 4)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
