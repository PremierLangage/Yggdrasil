extends=/model/AMC_TXT.pl 

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] | e }}
==

title= Compréhension de code 

questions=@ QuestionsAnalyseCode.txt

tag=Tableau|Initialisation|ParcoursTableau|Boucle


