extends = /model/basic/input.pl

title = Listening

file =$ /demo/data/english_sentence.mp3

question ==
<button onclick="player.play()" class="btn btn-sm btn-info icon-audio"></button>
<audio id="player" style="display:none" src="{{ sourcefile }}"></audio> 
==

tex2t ==
{{ audio_button(file) }} Transcrire la phrase.
==

sol ==
I'm gonna make him an offer he can't refuse
==

diffmeasure = EditRatio

tol % 0.1