




@ beurk.py [code.py]


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

oldout=sys.stdout 
sys.out=io.StringIO()
doctest.testfile("code.py")
grade = (100, f"Test result\n"+sys.out.getvalue())
sys.out = oldout 
==



@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/none.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==
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
filetotest="code.py" 
with open(filetotest,"w") as f:
    f.write(editor.code)

oldout=sys.out 
sys.out=io.StringIO()
doctest.testfile(filetotest)
grade = (100, f"Test result\n"+sys.out.getvalue())
sys.out = oldout 
==

