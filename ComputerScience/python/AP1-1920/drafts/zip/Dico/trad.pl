
# author zip
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = traduction approximative
text== 
Ecrire une fonction `traduit` qui reçoit un dictionnaire et un texte sous forme d'une suite de mots séparés par un espace<br>
les clefs et les valeurs du dictinnaire sont des str.<br>
La fonction remplace chaque clef du texte présente dans le dictionnaire par la valeur associé <br>
 
   >>> `traduit`{'tailleur':'taylor','riche':'rich','tu':'you','mon':'my','est':'is'},'eh mon tailleur est riche sur ')<br>
 eh my taylor is rich sur
==
before==
def traduit(d,mes):

    l=mes.split()
    t=list(l)
    for i in range(len(l)):
        t[i]=d.get(l[i],l[i])
    
    return " ".join(t) 
    
import random

d={'tailleur':'taylor','riche':'rich','tu':'you','mon':'my','est':'is'}
d["était"]='where'
liste=["Ah si j'étais riche",'eh mon tailleur est riche sur']
m=liste[0]
pltest3=""">>> traduit({},'{}')\n'{}'""".format(d,m,traduit(d,m))
after=before
==
editor.code==
def traduit(d,mes):
    if mes=='je teste un essai':
        return 'je teste un ESSAI'
    else :
     return 'tu testes un ESSAI'
==
pltest1==
>>> traduit({'essai':'ESSAI','e':'E','o':'O'},'je teste un essai')=='je teste un ESSAI'
True
==

pltest2==
>>> traduit({'essai':'ESSAI','e':'E','o':'O'},'tu testes un essai')
'tu testes un ESSAI'
 

==
 

