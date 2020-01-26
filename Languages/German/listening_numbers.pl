extends = /template/basicinput.pl

audio6 =$ /Languages/German/audio/De-sechs.ogg
audio5 =$ /Languages/German/audio/De-fünf.ogg

input.type = number

title = Addition

before ==
import random as rd
audiofile=rd.choice([audio5,audio6])
==

text ==

<audio controls="" src="{{audiofile}}">
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

