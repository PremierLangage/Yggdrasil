extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg
from numpy import linpace, cos, pi

t = linspace(0.0, 4.0, 100)
s = 1 + cos(pi*t)
plt.plot(t, s)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==