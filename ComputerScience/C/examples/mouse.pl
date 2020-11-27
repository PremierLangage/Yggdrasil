@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Answer
inputbox.maxlength = 3
inputbox.appearance = outline

url_clip =$ small24fps.mp4

before==

==

title==
Analyser une vidéo
==

text==
Quand le clip suivant, combien de souris le chat fait-il couiné ?


<video controls><source src="{{ url_clip }}" type="video/MP4"></video>

==

form==
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>

{{ inputbox|component}}
==

evaluator==#|python|
if 2 == int(inputbox.value):
    grade = (100, '''<span class="success-state">Mais oui, mais c'est bien sûr !</span>''')
else:
    grade = (0, '''<span class="error-state">Regardez mieux le chat, c'est celui qui a le plus de poil...</span>''')
==



