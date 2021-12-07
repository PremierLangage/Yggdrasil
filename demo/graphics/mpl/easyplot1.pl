extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg
from math importcos, pi

f = lambda x : 1 + cos(pi*x)
plt.plot(plt.gcf(), f, 0, 4)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
