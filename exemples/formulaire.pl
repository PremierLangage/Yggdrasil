
 
 
 # The template default will no be neccessary in the futur 
extends=/template/default.pl

title=  Une question ouverte 

text== 

Exprimez vos besoins et envies, vos attente sur la plateform.
Nous somme preneur de toute les bonnes idées.

Vous n'aurez pas de réponse directe a votre question.

Si vous souhaiter une réponse plus rapide utiliser le système de Q&A proposer dans la bande titre.

<a href="/ask/"> le Q&A lien direct </a>.

==


extracss==
<style>
.exercise__header {
background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/PanoMontBlancHDR_edit_1.jpg/800px-PanoMontBlancHDR_edit_1.jpg");
background-size: contain;
}
</style>
==

form == 
{{ inputbox1 |component}}
{{component|component }}
{{ inputbox2 |component}}
==

inputbox1 =: Input
inputbox1.type = number
inputbox1.placeholder = Answer
inputbox1.maxlength = 2
inputbox1.appearance = outline

inputbox2 =: Input
inputbox2.type = text
inputbox2.placeholder = Answer
inputbox2.maxlength = 100
inputbox2.appearance = outline
 


component =: CodeEditor

component.code ==
import os
==
#component.theme = white
component.language = python


evaluator==
answer['v1']=inputbox1.value
answer['v2']=inputbox2.value
answer['v3']=component.code

grade=(100,"Passez à la question suivante. ")
==

