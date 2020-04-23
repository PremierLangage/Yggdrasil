extends = /model/math.pl

title = Graphique

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64

n = 4
source = []

a = list_randint_norep(4,-2,2)
b = list_randint_norep(4,-2,2)

for i in range(n):
    x = np.arange(-5, 6, 0.01)
    y = (x - a[i])**2 + b[i]
    plt.plot(x, y)
    plt.title(f"Figure {i+1}")
    plt.grid(True)
    source.append(fig2base64(plt.gcf(), format="png"))
    plt.clf()

==

text ==
{% for i in range(n) %}
<img src="data:image/png;base64,{{source[i]}}" style="max-width: 400px; vertical-align:top; display: inline" />
{% endfor %}
==

form ==
==

evaluator ==
score = 100
==

