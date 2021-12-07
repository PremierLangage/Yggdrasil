extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot
from numpy import cos, pi

f = lambda x : 1 + cos(pi*x)
easyplot(plt.gcf(), f, 0, 4)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Title')
plt.grid(True)
plt.axis('equal')
plt.xlim(-1, 5)
plt.ylim(0, 2)
plt.grid(True)
plt.xticks(range(-1, 6))
plt.yticks(range(-0, 3))

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
