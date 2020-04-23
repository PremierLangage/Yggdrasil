extends = /model/math.pl

title = Paraboles

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64

n = 4
source = []

a = list_randint_norep(4,-2,2)
b = list_randint_norep(4,-2,2)

sol = randint(1,4)
var('x')
expr = (x - a[sol-1])**2 + b[sol-1]

for i in range(n):
    abs = np.arange(-4, 4, 0.01)
    ord = (abs - a[i])**2 + b[i]
    plt.plot(abs, ord)
    plt.title(f"Figure {i+1}")
    plt.grid(True)
    source.append(fig2base64(plt.gcf(), format="png"))
    plt.clf()

==

text ==
Parmi les représentations graphiques suivantes, laquelle correspond à la parabole d'équation
$$ y = {{expr.latex}} $$
{% for i in range(n) %}
<div style="display: inline"> 
<img src="data:image/png;base64,{{source[i]}}" style="max-width: 300px; vertical-align:top; display: inline" />
</div>
{% endfor %}
==

form ==
==

evaluator ==
score = 100
==

