extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot

f1 = lambda x : x**2
f2 = lambda x : x**3

easyplot(plt.gcf(), f1, -2.5, 2.5)
easyplot(plt.gcf(), f2, -2.5, 2.5)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==