
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/none.py

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

evaluator==
import doctest
import io
import sys
import code
    
oldout=sys.stdout 
sys.stdout=io.StringIO()
doctest.testmod(editor.code)
text= sys.stdout.getvalue()
sys.stdout = oldout 

grade = (100, f"Test result\n"+text)

==

