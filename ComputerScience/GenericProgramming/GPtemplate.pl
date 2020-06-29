#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Generic Programming Template

text==
This should be overwrited when inheriting from the Generic Programming Template
==

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.codes %=
[
    { "language": "shell", "code": "# write a bash code here" },
    { "language": "c", "code": "/* write a c code here */" },
    { "language": "cpp", "code": "// write a cpp code here" },
    { "language": "java", "code": "// write a java code here" },
    { "language": "python", "code": "# write a python code here" },
    { "language": "javascript", "code": "// write a javascript code here" }
]
==

before==
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, f"student code:\n{editor.code}, language: {editor.language}")
==
