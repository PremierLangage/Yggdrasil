extends = /model/basic/basic.pl
@ /utils/pltext.py

casesensitive % false

diffmeasure = EditDist

tol % 0

input =: Input

inputbox ==
{{ input|component }}
==

settings.feedback = rightwrong

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

if any([samestrings(input.value, item, diffmeasure=diffmeasure, tol=tol) for item in _sol_]):
    score = 100
else:
    score = 0
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