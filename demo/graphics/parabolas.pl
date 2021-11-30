extends = /model/math/math.pl

title = Paraboles

radio =: RadioGroup
radio.decorator = CustomRadio

before ==
import matplotlib.pyplot as plt
import numpy as np
from plmpl import fig2svg

n = 4
source = []

a = list_randint_norep(n,-2,2)
b = list_randint_norep(n,-5,5)

sol = randint(0,n-1)
radio.setitems([f"Figure {i+1}" for i in range(n)])
radio.setsol_from_index(sol)

var('x')
expr = (x - a[sol])**2 + b[sol]

for i in range(n):
    abs = np.arange(-2.5, 2.5, 0.01)
    ord = (abs - a[i])**2 + b[i]
    plt.plot(abs, ord)
    plt.title(f"Figure {i+1}")
    plt.grid(True)
    plt.gca().set_ylim((-6, 10))
    source.append(fig2svg(plt.gcf()))
    plt.clf()

==

text ==
Parmi les représentations graphiques suivantes, laquelle correspond à la parabole d'équation
$$ y = {{expr|latex}}.$$
{% for i in range(n) %}
<div class="img-container">
{{source[i]}}
</div>
{% endfor %}
==

style.exercise ==
.img-container {
    width: 60%;
    margin: auto;
    display: inline-block;
}

/* css appliqué sur les tablettes */
@media screen and (max-width: 768px) {
    .img-container {
        width: 40%;
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

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==

old ==
<img src="data:image/png;base64,{{source[i]}}" style="max-width: 300px; vertical-align:top; margin: auto; display: inline-block" />
==
