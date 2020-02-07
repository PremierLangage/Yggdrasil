extends = /template/basicinput.pl

audio1 =$ /Languages/English/audio/sentence1.mp3
audio2 =$ /Languages/English/audio/sentence2.mp3
audio3 =$ /Languages/English/audio/sentence3.mp3

input.type = number

title = Listening

before ==
import random as rd
sol=rd.randint(1,3)
lstaudio=[audio1,audio2,audio3]
audiofile=lstaudio[sol-1]
==

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Ecrire le nombre entendu (en caractères numériques).
==

extrajs==
<audio id="Audio" style="display:none" src="{{audiofile}}">
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

