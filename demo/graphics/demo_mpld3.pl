extends = /model/basic/basic.pl

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

question ==
<div class="img w50">
{{ image }}
</div>
==