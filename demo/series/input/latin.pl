extends = /model/series/input.pl

@ phrases.txt

title = Traduire des mots en contexte

nbstep % 3

intro ==
Pour chacune des {{nbstep}} phrases suivantes, traduire en latin le mot en gras (avec le bon cas).
==

textstep ==
<strong> Phrase {{ step + 1 }}. </strong><br> 

{{ phrases[step] }}
==