extends = /template/basicinput.pl

audio1 =$ /Languages/German/audio/De-sechs.ogg
audio2 =$ /Languages/German/audio/De-fünf.ogg
audio3 =$ /Languages/German/audio/De-sechs.ogg
audio4 =$ /Languages/German/audio/De-fünf.ogg
audio5 =$ /Languages/German/audio/De-fünf.ogg
audio6 =$ /Languages/German/audio/De-sechs.ogg

input.type = number

title = Addition

before ==
import random as rd
sol=rd.randint(1,6)
lstaudio=[audio1,audio2,audio3,audio4,audio5,audio6]
audiofile=lstaudio[sol-1]
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

