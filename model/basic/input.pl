extends = /model/basic/basic.pl
@ /utils/pltext.py

casesensitive % false

diffmeasure = EditDist

tol % 0

input =: Input

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col col-sm-4" style="padding-left:0.5em; padding-right:0;">
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
from pltext import edit_distance

def samestrings(str1, str2, diffmeasure="EditDist", tol=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
        return edit_distance(str1, str2)/len(str2) <= tol
    else:
        return edit_distance(str1, str2) <= tol

if isinstance(sol, str):
    _sol_ = sol.splitlines()
elif isinstance(sol, lst):
    _sol_ = sol

solution = _sol_[0]

if any([samestrings(input.value, item, diffmeasure=diffmeasure, tol=tol) for item in _sol_]):
    score = 100
    input.suffix = r'<i class="fas fa-check" style="color: #006400"></i>'
else:
    score = 0
    input.suffix = r'<i class="fas fa-times" style="color: #8B0000"></i>'
input.disabled = True
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