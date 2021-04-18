extends = /model/series/input.pl

data ==
phrase|motlatin
Le **maître** appelle l'esclave de son fils.|dominus
Le maître appelle l'**esclave** de son fils.|servum
Le maître appelle l'esclave de son **fils**.|filii
**Esclave**, donne de la nourriture aux chevaux.|serve
Esclave, donne de la nourriture aux **chevaux**.|equis
Les **fils** des esclaves devenaient eux-mêmes des esclaves.|filii
Les fils des **esclaves** devenaient eux-mêmes des esclaves.|servorum
L'**esclave** donne un livre au fils du maître.|servus
L'esclave donne un **livre** au fils du maître.|librum
L'esclave donne un livre au **fils** du maître.|filio
L'esclave donne un livre au fils du **maître**.|domini
==

title = Traduire des mots en contexte

nbstep % 3
delimiter % "|"

intro ==
{{sample_lines}}
Pour chacune des {{nbstep}} phrases suivantes, traduire en latin le mot en gras (avec le bon cas).
==

textstep ==
<strong> Phrase {{ step + 1 }}. </strong><br> 

{{ sample_lines[step]['phrase'] }}
==