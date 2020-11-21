




@ beurk.py [code.py]


title = Tester votre code 


form=

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

==



@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py




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


