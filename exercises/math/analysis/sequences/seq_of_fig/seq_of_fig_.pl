# TODO : reprendre l'exo WIMS associé (plus de suites, variantes dans la question, correction).

extends = /model/math/expr.pl

@ data.json [data.json]


before == #|py|
import json

def mat2svg(M, h):
    """Convert matrix data into svg figures."""
    n = len(M)
    m = len(M[0])
    svg = r"<svg width='%i' height='%i'>" % (n*h+2, m*h+2)
    for i in range(n):
        for j in range(m):
            if M[i][j]==1:
                svg += r"<rect x='%i' y='%i' width='20' height='20' style='stroke:black;stroke-width:1;fill-opacity:0' />" % (j*h+1,i*h+1)
    svg += r"</svg>"  
    return svg

with open('data.json') as f:  
    data = json.load(f)
    key = choice(list(data.keys()))
    seq = data[key]['figure']
    sol = sympify(data[key]['formula'])

fig=[]
for i in range(4):
    seq[i].reverse()
    fig.append(mat2svg(seq[i],20))
==

question == #|html|
On considère la suite de figures suivantes. <br>
<style>
figure {
    display: inline-block;
    margin: 20px; /* adjust as needed */
}
</style>
{% for i in range(4) %}
<figure>
{{ fig[i] }}
<figcaption style="text-align: center;">Fig. {{i+1}}</figcaption>
</figure>
{% endfor %}
<br>
Combien de cases possède la Figure $! n !$ ?
==