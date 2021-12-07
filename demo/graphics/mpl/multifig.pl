extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot
from numpy import sin, cos

f1 = lambda x : sin(x)
f2 = lambda x : cos(x)

easyplot(plt.gcf(), f1, -3, 3)
image1 = fig2svg(plt.gcf())

plt.clf()
easyplot(plt.gcf(), f2, -3, 3)
image2 = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
