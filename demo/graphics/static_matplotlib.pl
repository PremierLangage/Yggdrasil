extends = /model/math.pl

title = Graphique

before ==

import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2base64, fig2svg
from matplotlib.ticker import MaxNLocator

x = np.arange(0.1,10.5,0.1) # arbitrary data


t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt.plot(t, s)
#ax = plt.gca()
#ax.yaxis.set_major_locator(MaxNLocator(integer=True))
#plt.xlabel('time (s)')
#plt.ylabel('voltage (mV)')
#plt.title('About as simple as it gets, folks')
plt.grid(True)

source = fig2base64(plt.gcf(), format="png")
source = fig2svg(plt.gcf())
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
