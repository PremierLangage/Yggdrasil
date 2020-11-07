extends=/model/AMC_TXT.pl 

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | safe }}
==

title= Compréhension de code 

questions=@ QuestionsCode.txt

tag=Tableau|Initialisation|ParcoursTableau|Boucle






