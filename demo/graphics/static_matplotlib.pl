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

source = fig2base64(plt.gcf(), format="png")
source = fig2svg(plt.gcf())

==

text ==
<div style="width: 50%">
{{source}}
</div>
==

style.svg ==
.img-container {
    width: 60%;
}

/* On screens that are 500px or less*/
@media (max-width: 500px) {
    .img-container {
        width: 100%;
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
