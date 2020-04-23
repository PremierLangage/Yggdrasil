extends = /model/math.pl

title = Graphique

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64

n = 4
source = []

for i in range(n):
    t = np.arange(0.0, 2.0, 0.01)
    s = 1 + np.sin(2*np.pi*t)
    plt.plot(t, s)
    plt.xlabel('time (s)')
    plt.ylabel('voltage (mV)')
    plt.title('About as simple as it gets, folks')
    plt.grid(True)
    source = fig2base64(plt.gcf(), format="png")

==

text ==
{% for i in range(4) %}
<img src="data:image/png;base64,{{source[i]}}" style="max-width: 300px; vertical-align:top; display: inline" />
{% endfor %}
==

form ==
==

evaluator ==
score = 100
==

