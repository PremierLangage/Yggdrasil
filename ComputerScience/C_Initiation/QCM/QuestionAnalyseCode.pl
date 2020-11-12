extends=/model/AMC_TXT.pl 

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
<div style="-webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;"> {{ statement[step] | safe }}</div>
==

title= Compréhension de code 

questions=@ QuestionsAnalyseCode.txt

tag=Tableau|Initialisation|ParcoursTableau|Boucle



