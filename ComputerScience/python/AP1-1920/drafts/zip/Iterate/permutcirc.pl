
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =decalage circulaire gauche d'un mot
text== 
On appelle  decalage circulaire gauche d'un mot un mot obtenu en répétant un certain nombre de fois <br>
-enlever la première lettre du mot et la placer à la fin du mot.  	 <br>
les decalages circulaires gauches  de 'velo' sont : 'velo','elov','love','ovel'. <br>
On considèrera qu'un mot de longueur n possède n décalages. <br>
Ecrire une fonction `decale_gauche` qui reçoit une chaine de caratère et renvoie la liste de ses décalages
==
before==
def decale_gauche(mot):
    n=len(mot)
    l=[mot]
    for i in range(1,n):
        mot=mot[1:]+mot[0]
        l.append(mot)
    return(l)

import random
lst=['to','unvelo','bla','abcdefghij','import','mot','permutations','circulaires']

m=lst[random.randint(0,len(lst)-1)]

pltest3=""">>> decale_gauche('{}')\n{}""".format(m,decale_gauche(m))
==
pltest1==
>>> decale_gauche ("az")==["az",'za']
True
==
pltest2==
>>> decale_gauche ('azerty')
['azerty', 'zertya', 'ertyaz', 'rtyaze', 'tyazer', 'yazert']

==

