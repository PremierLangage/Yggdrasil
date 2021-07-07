extends = /model/basic/input.pl

audiofile =$ /demo/media/english_sentence.mp3

question ==
<audio id="player" src="{{ audiofile }}"></audio> 
<button onclick="player.play()" class="btn btn-sm btn-audio"></button> Transcrire la phrase.
==

sol ==
I'm gonna make him an offer he can't refuse
==

diffmeasure = EditRatio

tol = 0.1