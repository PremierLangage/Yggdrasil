
extends = /model/basic.pl

title = Graphes de fonctions

lang = fr

before==#|python|
from sympy import *
import random as rd
from sympy.plotting import plot
from jinja2 import Template
import matplotlib
matplotlib.rcParams['savefig.dpi'] = 80
matplotlib.rcParams['savefig.transparent'] = True
from io import BytesIO
import base64

def render_plot(arg):# arg must be a matplotlib plot
    figfile = BytesIO()
    arg.save(figfile)
    figfile.seek(0)  # rewind to beginning of file
    figdata_png = base64.b64encode(figfile.getvalue()).decode('ascii')
    figfile.close()
    arg._backend.close()

    return  Template('<img src="data:image/png;base64,{{ plot_data }}" \
        style="pointer-events:none;">').\
        render({'plot_data': figdata_png})

x = symbols('x')

graphe_1 = render_plot(plot(x**2))
graphe_2 = render_plot(plot(sin(x)))

==


text== 
Parmi les deux graphes suivants, lequel est le plus joli?
<br>
<div style="display:inline-block; width:40%; border:2px solid black;">{{ graphe_1 | safe }}</div>
<div style="display:inline-block; width:40%; border:2px solid black;">{{ graphe_2 | safe }}</div>
<br>
== 

form==
<select id = 'form_1'>
	<option value='oui'> Le premier, bien sûr </option>
	<option value='non'> Le second, of course </option>
	<option value='bof'> што такой ?? </option>
	<option value='blip'> WTF ? </option>
</select>
==

settings.feedback = lightscore

evaluator ==
import random as rd

f = rd.choice(['Excellente réponse', 'Merveilleuse réponse', 'Fabuleuse réponse', 'Délicieuse réponse', 'Charmante réponse', 'C\'est également mon avis', 'On ne saurait mieux dire', 'Cela est si juste!'])
s = 100
grade = (s, f)
==








