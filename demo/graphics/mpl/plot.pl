extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg
import numpy as np

t = np.linspace(0.0, 2.0, 100)
s = 1 + np.cos(2*np.pi*t)
plt.plot(t, s)

image = fig2svg(plt.gcf())
==

question ==
<div class="img w50">
{{ image }}
</div>
==