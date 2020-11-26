extends= /model/AMC2/QCM-AMCE.pl

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= 1er examen d'Introduction à la programmation C

text=
onepergroup % false

questions=@ ProgC_QCM_1.txt



