extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Drag Drop mathématique

before== #|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

# contenu des labels
integrale = r"$$\int_0^1 x^2\\, dx$$" # bug d'affichage: \, affiche une virgule
fraction =  r"$$\frac12 - \frac13$$"
limite = r"$$\lim_{x\to +\infty} x\sin(1/x)$$"
determinant = r"$$\det\begin{pmatrix} 1 & 2\\\\ 1 & 3\end{pmatrix}$$" # bug d'affichage: la matrice s'affiche sur une ligne



# contenu des boutons "drop"
qui_vaut_1 = r"Poser ici une expression égale à $$1$$"
qui_vaut_tiers = r"Poser ici une expression égale à $$1/3$$"

# fabrication du groupe
mygroup = DragDropGroup()
# les labels
mygroup.set_label({"integrale": integrale, "fraction": fraction, "limite":limite, "determinant": determinant})
# les drops
mygroup.set_drop({"1" : qui_vaut_1, "tiers": qui_vaut_tiers})
# les liens corrects
mygroup.set_match_by_name("tiers", "integrale")
mygroup.add_match_by_name("1", ["limite","determinant"])

# Ce qui suit sert uniquement à faire voyager le groupe dans le grader
a = mygroup.drops['1'] 
# bug incroyable : si le nom est 'q' au lieu de 'a', et qu'on remplace dans le text/evaluator, ça bugge
b = mygroup.drops["tiers"]
c = mygroup.labels["integrale"]
d = mygroup.labels["limite"]
e = mygroup.labels["fraction"]
f = mygroup.labels["determinant"]
g = mygroup._matches
a.css='drop'
b.css='drop'
c.css = 'drag'
d.css = 'drag'
e.css = 'drag'
f.css = 'drag'
==

text==
Question : {{ a | component }} {{ b | component }}
==

form==
{{ c | component }}
{{ d | component }}
{{ e | component }}
{{ f | component }}

==

settings.feedback = lightscore

evaluator==
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong
mygroup = DragDropGroup()
mygroup.labels = {"integrale": c, "limite": d, "fraction": e, "determinant": f}
mygroup.drops = {"1": a, "tiers": b}
mygroup._matches = g

grade=mygroup.eval(grading_function = right_minus_wrong) 
a.css='success-state'
b.css='error-state'
==

extracss == #|html| 
<style>
    .drag{
    display: inline-flex;
    width: inherit;
	height: inherit;
	margin : 6px;
    vertical-align:top;
	justify-content: center;
	align-items: center;
    }

    .drop{
     display: inline-flex;
    width: 10em;
	height: 10em;
	margin : 6px;
    vertical-align:top;
	justify-content: center;
	align-items: center;
    background-color:burlywood;
    }
    .success{
    background-color:lightGreen;
    }
    .error{
    background-color:lightPink;
    }
</style>
==














custom_pl_template == #|html|
    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class='exercise__title'>{% if title %}{{ title }}{% endif%}</ion-card-title>
        Salut les amis
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









