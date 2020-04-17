
extends = /model/basic.pl

title = Graphes de fonctions

lang = fr

before==#|python|
from sympy import *
import random as rd
from sympy.plotting import plot
from jinja2 import Template
import json
import matplotlib
#matplotlib.use('agg')
matplotlib.rcParams['savefig.dpi'] = 80
#matplotlib.rcParams['figure.figsize'] = (4,3)
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
        style="pointer-events:none; width:inherit; height:inherit">').\
        render({'plot_data': figdata_png})


x = symbols('x')

coeff = 0
    
fonction1 = 0
for j in range(3):
    fonction1 = fonction1 + rd.uniform(-1,1)*sin(rd.uniform(-5,5)*x+rd.uniform(-3,3))
    
fonction2 = 0
for j in range(3):
    fonction2 = fonction2 + rd.uniform(-1,1)*sin(rd.uniform(-5,5)*x+rd.uniform(-3,3))

graphe_1 = render_plot(plot(fonction1,(x,-2, 2), ylim=(-3,3)))
graphe_2 = render_plot(plot(fonction2,(x,-2, 2), ylim=(-3,3)))
==


text== 
Parmi les deux graphes suivant, lequel est le plus joli?
<br>
<span style="width:300px;height:300px; border:10px solid black;">{{ graphe_1 | safe }}</span>
<span style="width:300px;">{{ graphe_2 | safe }}</span>
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

feedback = rd.choice(['Excellente réponse', 'Merveilleuse réponse', 'Fabuleuse réponse', 'Délicieuse réponse', 'Charmante réponse', 'C\'est également mon avis', 'On ne saurait mieux dire', 'Cela est si juste!'])
score = 100
grade = (score, feedback)
==








