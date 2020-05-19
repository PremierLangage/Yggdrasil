
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py
@ /utils/graphics/plmpl.py

title = Figure Matplotlib

before ==
import matplotlib.pyplot as plt
import numpy as np
import mpld3
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
plt.title('About as simple as it gets, folks')
plt.grid(True)

image = mpld3.fig_to_html(plt.gcf())

==

text ==
{{image}}
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

