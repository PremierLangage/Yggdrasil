extends = /template/basicinput.pl

audio1 =$ /Languages/German/audio/De-eins.ogg
audio2 =$ /Languages/German/audio/De-zwei.ogg
audio3 =$ /Languages/German/audio/De-drei.ogg
audio4 =$ /Languages/German/audio/De-vier.ogg
audio5 =$ /Languages/German/audio/De-fünf.ogg
audio6 =$ /Languages/German/audio/De-sechs.ogg

input.type = number

title = Nombres

before ==
import random as rd
sol=rd.randint(1,6)
lstaudio=[audio1,audio2,audio3,audio4,audio5,audio6]
audiofile=lstaudio[sol-1]
==

text ==
<audio controls="" src="{{audiofile}}">
</audio> 
==

evaluator ==
if input.value==sol:
    grade=(100,"")
else:
    grade=(0,str(sol))
==

