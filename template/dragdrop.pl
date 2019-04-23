extends = /Mathematics/template/mathbasic.pl
@ /input/drop/template.html [drop_template.html]
@ /input/drag/template.html [drag_template.html]
@ /input/dragdrop/head.html [dragdrop_head.html]
@ /input/dragdrop/process.py [dragdrop_process.py]

title = Champ de réponse dragdrop

text =

before==
import random
biglist=list(range(-100,101))
a=3*[0]
b=3*[0]
drop={}
for i in range(3):
    a[i],b[i]=random.sample(biglist,2)
    if a[i]<b[i]:
        drop[str(i)]='leq'
    else:
        drop[str(i)]='geq'
==

form ==
Ordonner les couples de nombres suivants en utilisant les symboles {{ input_1_leq }} ou {{ input_1_geq }}.<br>
<ul>
<li> $% {{a.0}} %$ {{ input_1_0 }} $% {{b.0}} %$ </li>
<li> $% {{a.1}} %$ {{ input_1_1 }} $% {{b.1}} %$ </li>
<li> $% {{a.2}} %$ {{ input_1_2 }} $% {{b.2}} %$ </li>
</li>
==

input.1.type = dragdrop
input.1.drag = {'leq':'$$\leq$$','geq':'$$\geq$$'}
input.1.drop = {{drop}}
input.1.cloneable = yes
input.1.style = min-width:4em

evaluator ==
score=answer['1']['score']
feedback=answer['1']
==
