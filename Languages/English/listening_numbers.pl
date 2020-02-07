extends = /model/basicinput.pl

@ /Languages/English/audio/numbers.json [data.json]

input.type = number

title = Numbers

before ==
import random as rd
import json

with open('data.json','r',encoding='utf8') as f:
    number=json.load(f)

sol=rd.randint(1,9)
s=number[str(sol)]
==

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Quel nombre entends-tu ?
==

extrajs==
<audio id="Audio" style="display:none" src="data:audio/mp3;base64,{{s}}">
</audio> 
<script>
var x = document.getElementById("Audio"); 
function playAudio() { 
  x.play(); 
} 
</script>
==

evaluator ==
if input.value==sol:
    grade=(100,"")
else:
    grade=(0,str(sol))
==



