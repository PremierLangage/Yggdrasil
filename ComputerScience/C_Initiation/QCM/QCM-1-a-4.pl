extends= /model/AMC2/QCM-AMCE.pl

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= Examen d'Introduction à la programmation C

text=
onepergroup % false

questions=@ QCM-1-a-4.txt






