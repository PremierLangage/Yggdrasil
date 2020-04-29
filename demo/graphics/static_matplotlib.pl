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
{{source}}
<div class="svg-container">

</div>
==

style.svg ==
.svg-container {
display: inline-block;
position: relative;
width: 100%;
padding-bottom: 100%;
vertical-align: middle;
overflow: hidden;
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
