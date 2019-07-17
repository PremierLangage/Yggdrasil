
 
 
 # The template default will no be neccessary in the futur 
extends=/template/default.pl
title= &nbsp;

text== 

Testez vos compétances en markdown et MathJax 
en écrivant du code markdown et mathjax dans l'éditeur 
et nous allons vous afficher le résultat. 

==

editor.id=essai
editor.height=200
editor.code==
# un titre 
**du gras**
du mathjax: $% \frac{a}{b} %$
==
evaluator==

grade=(100,response['essai'])
==


extracss==
<style>
.exercise__header {
background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Cat_playing_with_a_lizard.jpg/2880px-Cat_playing_with_a_lizard.jpg");
background-size: contain;
}
</style>
==



 





