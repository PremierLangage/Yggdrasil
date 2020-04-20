@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Drag Drop mathématique

before== #|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

# contenu des labels
integrale = r"$$\int_0^1 x^2\\, dx$$" # certains \ doivent être \\ sinon ils sont interprétés différemment
fraction =  r"$$\frac12 - \frac13$$"
limite = r"$$\lim_{x\to +\infty} x\sin(1/x)$$"
determinant = r"$$\det\begin{pmatrix} 1 & 2\\\\ 1 & 3\end{pmatrix}$$" 


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
a.css = 'drop'
# bug incroyable : si le nom est 'q' au lieu de 'a', et qu'on remplace dans le text/evaluator, ça bugge
b = mygroup.drops["tiers"]
b.css='drop'



c = mygroup.labels["integrale"]
c.css='drag'
d = mygroup.labels["limite"]
d.css = 'drag'
e = mygroup.labels["fraction"]
e.css = 'drag'
f = mygroup.labels["determinant"]
f.css = 'drag'
g = mygroup._matches
==

text==
Question : {{ a | component }} {{ b | component }}
==

form==
{{ c | component }}
<br>
<br>
{{ d | component }}
{<br>
<br>
{{ e | component }}
<br>
<br>
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
==

extracss == #|html|
<style>
.drag{
    width:inherit !important;
    height:inherit !important;
    overflow:hidden !important;

    }
.drop{
    width:100px !important;
    height:60px !important;
    overflow:hidden !important;
    }
</style>

==


custom_pl_template == #|html|
<ion-card class="exercise">
    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class='exercise__title'
                              style="	color: #ffffff;	font-size: 24pt; text-decoration: none;
                background-color: #ff9400;
                margin-top: 0;
                margin-bottom: 20px;
                padding: 10px 10px 10px 20px;
                display:flex;
                justify-content: space-between;">
                {% if title %}{{ title }}{% endif%}
        </ion-card-title>
    </ion-card-header>
    <!-- BODY -->
    <ion-card-content class="exercise__body">
        <!-- INSTRUCTIONS -->
        <div class="exercise__instructions"
            style = "padding: 20px;background-color:#F5F5F5;">
            {% if text %}
            {{ text|markdown|safe }}
            {% endif %}
        </div>
        <!-- FORM -->
        {% csrf_token %}
        <div class="exercise__form">
            {% block form %}{{ form|safe }}{% endblock %}
        </div>
        <br/>
        <!-- FOOTER -->
        <ion-footer class="ion-no-border" style = "height:4em; background-color:beige">
        <!-- FEEDBACK -->
        <div text-right class="exercise__feedback">
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
</ion-card>
==
















