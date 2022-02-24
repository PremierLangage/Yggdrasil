extends = /model/basic/basic.pl
@ /utils/pltext.py

casesens = False

diffmeasure = EditDist

tol = 0

input =: Input

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

evaluator ==
input.eval()
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