extends = /model/math.pl

title = Graphique

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64

n = 4
source = []



for i in range(n):
    x = np.arange(-5, 5, 0.01)
    y = (x - 2)**2
    plt.plot(t, s)
    plt.title('About as simple as it gets, folks')
    plt.grid(True)
    source.append(fig2base64(plt.gcf(), format="png"))
    plt.clf()

==

text ==
{% for i in range(n) %}
<img src="data:image/png;base64,{{source[i]}}" style="max-width: 300px; vertical-align:top; display: inline" />
{% endfor %}
==

form ==
==

evaluator ==
score = 100
==

