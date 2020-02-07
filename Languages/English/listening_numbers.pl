extends = /template/basicinput.pl

audio1 =$ /Languages/German/audio/De-eins.ogg
audio2 =$ /Languages/German/audio/De-zwei.ogg
audio3 =$ /Languages/German/audio/De-drei.ogg
audio4 =$ /Languages/German/audio/De-vier.ogg
audio5 =$ /Languages/German/audio/De-fünf.ogg
audio6 =$ /Languages/German/audio/De-sechs.ogg

input.type = number

title = Numbers

before ==
import random as rd
import random as rd

with open('data.json','r',encoding='utf8') as f:
    number=json.load(f)

s=number['3'].encode('utf-8')
==

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Ecrire le nombre entendu (en caractères numériques).
==

extrajs==
<audio id="Audio" style="display:none" src="data:audio/mp3;{{s}}">
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


