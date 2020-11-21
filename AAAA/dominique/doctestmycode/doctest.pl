
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==



title = Tester votre code 

text==
==

form==
{{ editor|component }}
==

before==
import doctest
import io
import sys
import code
    
oldout=sys.stdout 
sys.stdout=io.StringIO()
doctest.testmod(code)
text= sys.stdout.getvalue()
sys.stdout = oldout 

grade = (100, f"Test result\n"+text)

==

