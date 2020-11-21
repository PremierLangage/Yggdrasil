







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
TEXT= sys.stdout.getvalue()
text=TEXT.replace("\n","    \n")
sys.stdout = oldout 

==



@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py




title = Tester votre code 

text=

form=


