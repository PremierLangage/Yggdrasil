
extends= /model/AMC2/QCM-AMCE.pl

title= Anna's Exo

questions==

** Quel est le prénom de Revuz
+Dominique
-Christian

* Quel est le prénom de Diaw
+Anna
-Aminata

*+ Clicker sur la bonne conjugaison du verbe  
>Je suis ( aller / {{allé}} ) au bureau hier

=** Choisir les mots qui sont des mots clefs de python
+=["assert","async","await","break","class","continue","def","del","else","except","finally"]
-=["whiles","boucle","attend","cause","deff","dep"]

=*[nb=5,group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]

=*[nb=3,group=odd] What are the even numbers ? 
-=[x for x in range(3,77) if x%2==1 ]
+=[x for x in range(3,77) if x%2==0 ]

==

