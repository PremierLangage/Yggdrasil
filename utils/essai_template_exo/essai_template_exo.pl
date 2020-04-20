
extends = /model/basic.pl

title = Graphes de fonctions

lang = fr

settings.feedback = lightscore


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

evaluator ==
import random as rd

f = rd.choice(['Excellente réponse', 'Merveilleuse réponse', 'Fabuleuse réponse', 'Délicieuse réponse', 'Charmante réponse', 'C\'est également mon avis', 'On ne saurait mieux dire', 'Cela est si juste!'])
s = 100
grade = (s, f)
==









custom_pl_template == #|html|
    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class='exercise__title'>{% if title %}{{ title }}{% endif%}</ion-card-title>
    </ion-card-header>
    <!-- BODY -->
    <ion-card-content class="exercise__body">
        <!-- FORM -->
        {% csrf_token %}
        <div class="exercise__form">
            {% block form %}{{ form|safe }}{% endblock %}
        </div>
        <br/>
        <!-- INSTRUCTIONS -->
        <div class="exercise__instructions">
            {% if text %}
            {{ text|markdown|safe }}
            {% endif %}
        </div>
        <!-- FOOTER -->
        <ion-footer class="ion-no-border">
        <!-- FEEDBACK -->
        <div class="exercise__feedback">
            {{ feedback__|markdown|safe if feedback else "" }}
        </div>
        <!-- ACTIONS -->
        <div class="exercise__actions text-center">
            <div class="btn-group" role="group" aria-label="actions">
                <button class="btn btn-primary action-submit">
                    <i id="validate" class="fas fa-check"></i>
                    <span class="ion-hide-md-down">Valider</span>
                </button>
                {% if tests %}
                <a type="button" class="btn btn-primary action-test"
                href="{{ url('playexo:test_pl', pl_id__)}}"
                target="_blank" test>
                    <i class="fas fa-angle-double-right"></i>
                    <span class="ion-hide-md-down">Tester</span>
                </a>
                {% endif %}
                <a type="button" class="btn btn-secondary action-download-env"
                href="{{ url('filebrowser:dlenv', id__) }}" download>
                    <i class="fas fa-download"></i>
                    <span class="ion-hide-md-down">Télécharger l'Environnement</span>
                </a>
            </div>
        </div>
        <!-- SPINNER -->
        <div class="exercise__spinner text-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        </ion-footer>
    </ion-card-content>

==













