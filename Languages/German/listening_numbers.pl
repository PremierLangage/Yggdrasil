extends = /template/basicinput.pl


@ ComputerScience/C/examples/napoleon.jpg

input.type = number

title = Addition

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
 <audio controls>
<source src="number.ogg" type="audio/ogg">
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

