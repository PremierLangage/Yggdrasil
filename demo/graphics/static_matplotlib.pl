extends = /model/math.pl

title = Graphique

before ==

import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64, fig2svg
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
plt.title('About as simple as it gets, folks')
plt.grid(True)

from sympy import symbols
from sympy.plotting import plot
x = symbols('x')
p1 = plot(x*x, backend='matplotlib')

source = fig2base64(plt.gcf(), format="png")
source = fig2svg(plt.gcf())
source = fig2svg(p1.save())

==

text ==
<div class="img-container">
{{source}}
</div>
==

style.svg ==
.img-container {
    width: 60%;
    margin: auto;
}

@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-container {
        width: 80%;
        margin: auto;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-container {
        width: 100%;
        margin: auto;
    }
}
==


form ==
==

evaluator ==
score = 100
==

old ==
<img src="data:image/png;base64,{{source}}"/>

<img src="data:image/png;base64,{{source}}" style="width: 100%; height: auto; max-width: 600px;"/>
<img src="data:image/png;base64,{{source}}" style="max-width: 300px; vertical-align:top; display: inline" />
==
