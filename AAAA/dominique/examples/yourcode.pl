

@ /utils/sandboxio.py

builder =@ /builder/before.py


grader =@/grader/evaluator.py




title= Editeur executeur de python


text==

==

before==
==




# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
editor.cid = py_editor_0
editor.code ==

==
form==

{{ editor  | component }}
==


evaluator==

student=editor.code
with open("student.py","w") as f:
    f.write(student)


import doctest
import subprocess
import re

def execute(args, instr):
    """
    :param args: the subprocess parameter
    :param instr: the input file for the subprocess parameter
    :return:
        boolean: code de retour 
        stdout
        stderr
    """
    try:
        p = subprocess.Popen(" ".join(args), stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,shell= True)
        sortieo,sortiee = p.communicate(input=instr.encode())
        return p.returncode == 0, sortieo.decode(),sortiee.decode() 
    except Exception as e:
        return False, " ".join(args), type(e)+"UUUUUU"+str(e)

rval = execute(['python3','student.py'],"")
if rval[0]:
    feedback = rval[1]
else:
    feedback = rval[2]

feedback = "<div style='white-space: pre-wrap;'>" + feedback + "</div>"

grade=(100, feedback)

==
