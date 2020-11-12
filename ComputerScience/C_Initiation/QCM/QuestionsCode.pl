extends=/model/AMC2/QCM-AMCE.pl
#extends=/model/AMC_TXT.pl 
textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= Compréhension de code 

text=
onepergroup % false

questions=@ QuestionsCode.txt











