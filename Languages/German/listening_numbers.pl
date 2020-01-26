extends = /template/basicinput.pl

image =$ /Languages/German/audio/De-sechs.ogg

input.type = number

title = Addition

before ==
import base64
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
audiofile=base64.b64encode(image)
urlSafeEncodedBytes = base64.urlsafe_b64encode(image.encode("utf-8"))
audiofile = str(urlSafeEncodedBytes, "utf-8")
==

text ==

<audio controls>
<source src={{audiofile}} type="audio/ogg">
Your browser does not support the audio element.
</audio> 
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"")
    else:
        grade=(0,"%d + %d = %d" % (a,b,a+b))
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==

