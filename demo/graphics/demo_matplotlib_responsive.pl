@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py
@ /utils/graphics/plmpl.py

title = Figure Matplotlib

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg, easyplot
import numpy as np

t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)

def f(x):
    return 1+np.sin(2*np.pi*x)

#plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
easyplot(plt.gcf(), f, 0, 2)
plt.title('About as simple as it gets, folks')
plt.grid(True)
plt.show()

image = fig2svg(plt.gcf())
==

text ==
<div class="img-container">
{{ image|safe }}
</div>
==

form ==
==

extracss ==
<style>
.img-container {
    width: 60%;
    margin: auto;
}

/* css appliqué sur les tablettes */
@media screen and (max-width: 768px) {
    .img-container {
        width: 80%;
        margin: auto;
    }
}

/* css appliqué sur les téléphones */
@media screen and (max-width: 576px) {
    .img-container {
        width: 100%;
        margin: auto;
    }
}
</style>
==


