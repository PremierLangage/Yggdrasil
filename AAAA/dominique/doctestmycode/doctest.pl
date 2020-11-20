
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

title = Code Editor Component

text==
==

form==
{{ editor|component }}
==

evaluator==
import doctest
import io
import sys
oldout=sys.out 
sys.out=io.StringIO()
doctest.testfile(filetotest)
grade = (100, f"Test result\n"+sys.out.getvalue())
sys.out = oldout 
==

