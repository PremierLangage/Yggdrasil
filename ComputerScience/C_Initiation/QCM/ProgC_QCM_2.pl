extends= /model/AMC2/QCM-AMCE.pl

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= 2ème examen d'Introduction à la programmation C

text=
onepergroup % true

questions=@ ProgC_QCM_2.txt




