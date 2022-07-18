
extends= /model/AMC2/QCM-AMCE.pl

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= Compréhension de code 

text=
onepergroup % true

questions=@ QuestionsAnalyseCode.txt

tag=Tableau|Initialisation|ParcoursTableau|Boucle

