@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

title = Figures Matplotlib

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2svg

t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
plt.title('About as simple as it gets, folks')
plt.grid(True)

image = fig2svg(plt.gcf())
==

text ==
<div class="img-container">
{{ image|safe }}
</div>
==

form =

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


