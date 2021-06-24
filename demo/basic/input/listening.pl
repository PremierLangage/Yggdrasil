extends = /model/basic/input.pl

title = Listening

audiofile =$ /demo/data/english_sentence.mp3

question ==
{{audiofile}}
<audio id="player" controls src="{{ audiofile }}"></audio> 
<button onclick="player.play()" class="btn btn-sm btn-info icon-audio"></button> Transcrire la phrase.
==

tex2t ==
{{ audio_button(file) }} Transcrire la phrase.
==

sol ==
I'm gonna make him an offer he can't refuse
==

diffmeasure = EditRatio

tol % 0.1