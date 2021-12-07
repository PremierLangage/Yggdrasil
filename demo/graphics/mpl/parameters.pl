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
n = 5
plt.xlim(-n, n)
plt.ylim(-n, n)
plt.grid(True)
plt.xticks(range(-n, n+1))
plt.yticks(range(-n, n+1))

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==
