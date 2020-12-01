extends = /model/basic/input.pl

title ==
Listening
==

audiofile =$ data/english_sentence.mp3

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Transcrire la phrase.

<audio id="Audio" style="display:none" src="{{ audiofile }}"></audio> 

<script>
    var x = document.getElementById("Audio"); 
    function playAudio() {x.play();} 
</script>
==

solution ==
I'm gonna make him an offer he can't refuse.
==

diffmeasure = EditRatio

tolerance = 0.1
