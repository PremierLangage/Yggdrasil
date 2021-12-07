extends = /model/basic/basic.pl
@ /utils/graphics/plmpl.py

before ==
import matplotlib.pyplot as plt
from plmpl import fig2svg
import numpy as np

t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt(s, t)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
plt.title('About as simple as it gets, folks')

image = fig2svg(plt.gcf())
==

question ==
<div class="img w40">
{{ image|safe }}
</div>
==