extends = /model/basic/basic.pl

# Main keys

question ==
Quelle est la réponse ?
==

sol ==
toto
==

casesens = False

diffmeasure = EditDist

tol = 0

# Input block

prefix ==
Réponse :
==

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col col-sm-6 col-md-4" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from textinput import TextInput
input = TextInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
input.set_sol(sol)
input.evalparam = {'diffmeasure':diffmeasure, 'tol':tol, 'casesens':casesens}
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==

style.input ==
<style>
.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
}

.mat-form-field-appearance-outline .mat-form-field-infix {
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}
</style>
==


macros ==
{% macro audio_button(sourcefile) -%}
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button>
<audio id="Audio" style="display:none" src="{{ sourcefile }}"></audio> 
<script>
    var x = document.getElementById("Audio"); 
    function playAudio() {x.play();} 
</script>
{%- endmacro %}
==