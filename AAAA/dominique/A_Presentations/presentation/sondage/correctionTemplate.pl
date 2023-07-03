
extends = /model/opentext.pl


builder =@ /builder/bbefore.py

@ correction.py

@ cortemplate.html [template.html]


title=
text= "ceci doit disparaitre" 
form =


before==
kjqlhsdfkjdsfhkl

import correction
import random
feedback = correction.FeedbackCor()

for x in range(10):
    feedback.addCopie(random.randint(5),random.choice(["if","\nelse\fifi\n\ntoto\nthen","else\fifi\n\ntoto","fifi\n\ntoto"],
        random.randint(1,10)*10)

text = "hoho"+ feedback.render()+ "haha"

==

grader=

