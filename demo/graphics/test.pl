extends = /model/math.pl

title = Graphique

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64, fig2svg
from matplotlib.figure import Figure
from matplotlib.ticker import MaxNLocator

from sympy import symbols
from sympy.plotting import plot
x = symbols('x')
p1 = plot(x*x, (5, 5))

def test2(p1):
    return p1._backend.fig

#source = fig2base64(, format="png")
source = fig2svg(test2(p1))
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

