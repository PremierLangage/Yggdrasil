extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot
from numpy import cos, pi

f = lambda x : x**2
easyplot(plt.gcf(), f, -2.5, 2.5)
plt.title('Title')
plt.xlabel('x')
plt.ylabel('y')
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
