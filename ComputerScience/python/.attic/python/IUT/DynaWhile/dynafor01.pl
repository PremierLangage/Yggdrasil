

oneshot=True

author=dr


extends=/ComputerScience/python/template/soluce.pl
template=/ComputerScience/python/.attic/python/IUT/template.pl
title=La boucle for

code==
*****
****
***
**
*
==

text==

Ecrire une boucle for qui réalise la description suivante :

<pre>
{{code}}
</pre>

Attention pas de boucle while ;)

==

plsoluce==
    Exo1 - boucle for | 
==

soluce==
for i in range(0, 5):
    for j in range(i, 5):
        print("*")
    print("\n")
==

success==
Cool!
==

needed=for
taboo=while

