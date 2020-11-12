extends=/model/AMC_TXT.pl 

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ <span data-unselectable="unselectable content">statement[step]</span>
| safe }}
==

title= Compréhension de code 

questions=@ QuestionsAnalyseCode.txt

tag=Tableau|Initialisation|ParcoursTableau|Boucle



