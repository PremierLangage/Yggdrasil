@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==
==

title = Echange de valeur

text==
écrire un programme qui ion initialise une liste de 5 entier et affiche <br>
<ul>
    <li>Milk</li>
    <li>Cheese
        <ul>
            <li>Blue cheese</li>
            <li>Feta</li>
        </ul>
    </li>
</ul>
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, f"student code:\n{editor.code}")
==
