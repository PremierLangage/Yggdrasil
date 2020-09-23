
## NE FONCTIONNNE PAS


 
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python

before=


title = Tester votre markdown

text==
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, f"student code:\n{editor.code}")
==

title= &nbsp;

text== 

Testez vos compétances en markdown et MathJax 
en écrivant du code markdown et mathjax dans l'éditeur 
et nous allons vous afficher le résultat. 

{{visu}}
==

editor.id=essai
editor.height=200
editor.code==
# un titre 
**du gras**
du mathjax: $% \frac{a}{b} %$
==
evaluator==
visu = editor.code
grade=(100,visu)

==


extracss==
<style>
.exercise__header {
background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Cat_playing_with_a_lizard.jpg/2880px-Cat_playing_with_a_lizard.jpg");
background-size: contain;
}
</style>
==



 







