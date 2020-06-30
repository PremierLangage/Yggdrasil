#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
@ before_mode.py [builder.py]
@ evaluator_mode.py [grader.py]

title=Standard C Programming exercise template

text==
This text shoud be overwrited when inheriting from the Standard C 
Programming exercise template
==


editor =: CodeEditor
editor.theme=dark
editor.language=c

editor.code ==
/* write your code here */
==

before==
==


form==
{{ editor|component }}
==

solution==
The code solution for the exercise once you inherit from this template...
==

evaluator==
grade = (100, f"student code:\n{editor.code}")
==


custom_pl_template == #|html|

    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class='exercise__title'>
                {% if title %}{{ title }}{% endif%}
        </ion-card-title>
    </ion-card-header>
    <!-- BODY -->
    <ion-card-content class="exercise__body">
        <!-- INSTRUCTIONS -->
        <div class="exercise__instructions">
            {% if text %}
            {{ text|safe }}
            {% endif %}
        </div>
        <!-- FORM -->
        {% csrf_token %}
        <div class="exercise__form">
            {{ form|safe }}
        </div>

       <!-- FEEDBACK -->
      {{ feedback_formatted|safe }}
      {{ hint_formatted|safe }}
      {{ solution_formatted|safe }}
    </ion-card-content>

<ion-footer class="app-header">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a tabindex="0" class="btn btn-success my-2 my-sm-0 action-submit" role="button" >Valider</a>
     <span class="navbar-text" style="font-size:medium;">
    {% if score or score > -1 %}
    &nbsp; Score : {{score}} / 100
    {% else %}
    &nbsp; Score : - / 100
    {% endif %}
    &nbsp; | &nbsp;
    Tentative : {{attempt}} / {{maxattempt}}
  </span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav ml-auto">
      <a tabindex="0" class="nav-item nav-link btn" id="getFeedback" role="button">Feedback</a>
      <a tabindex="0" class="nav-item nav-link btn" id="getHint" role="button">Indication</a>
      <a tabindex="0" class="nav-item nav-link btn" id="getSolution" role="button">Solution</a>
      <a tabindex="0" class="nav-item nav-link btn" id="getSolution" role="button">A propos</a>
    </div>
  </div>
</nav>
</ion-footer>


==

extrajs ==#|html|
<script>
$('#closeFeedback').on('click', function() {
  $("#Feedback").hide();  
});

$('#getFeedback').on('click', function() {
  $("#Feedback").show();
});

$('#closeHint').on('click', function() {
  $("#Hint").hide();  
});

$('#getHint').on('click', function() {
  $("#Hint").show();
});

$('#closeSolution').on('click', function() {
  $("#Solution").hide();  
});

$('#getSolution').on('click', function() {
  $("#Solution").show();
});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

==
