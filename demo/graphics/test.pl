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
import matplotlib.ticker as ticker

def test2():
    x = symbols('x')
    p1 = plot(3x+1, (x,-5,5))
    fig = p1._backend.fig
    ax = fig.gca()
    ax.grid(True)
    majors = [0, 1, 5]
    ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    #ax.xaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    #ax.yaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    ax.set_xlabel('')
    ax.set_ylabel('')
    return fig

#source = fig2base64(, format="png")
source = fig2svg(test2())
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

