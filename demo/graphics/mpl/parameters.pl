extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot

f = lambda x : x**2
easyplot(plt.gcf(), f, -2.5, 2.5, color='red')

plt.title('Parabole')
plt.xlim(-3, 3)
plt.ylim(0, 6)
plt.xticks(range(-3, 4))
plt.yticks(range(0, 7))
plt.grid(True)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
