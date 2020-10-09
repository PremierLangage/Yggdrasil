
extends= /model/AMC2/QCM-AMCE.pl

title= Anna's Exo

questions==

**[group=prenom] Quel est le prénom de Revuz
+Dominique
-Christian
+Paul
+Edouard

*[group=prenom] Quel est le prénom de Diaw
+Anna
-Aminata

*+ Clicker sur la bonne conjugaison du verbe  
>Je suis ( aller / {{allé}} ) au bureau hier

=**[nbb=2,nbg=2] Choisir les mots qui sont des mots clefs de python
+=["assert","async","await","break","class","continue","def","del","else","except","finally"]
-=["whiles","boucle","attend","cause","deff","dep"]

=*[nb=5,group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]

=*[nb=3,group=odd] What are the even numbers ? 
-=[x for x in range(3,77) if x%2==1 ]
+=[x for x in range(3,77) if x%2==0 ]

==

doc==

* AMC avec possibilité d'un seul choix de réponse et donc une seule bonne réponse possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

** AMC avec possibilité de plusieurs choix de réponse et donc plusieurs bonnes réponses possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

*+ Cliquer sur les mots ; mettre les bonnes réponses entre accolades {{ }}
Réponse à mettre sous la forme : >

=* AMC avec possibilité d'une seule bonne réponse parmi une liste ou une compréhension python
Réponses à mettre sous la forme : += Liste_de_Bonne_Rep ou compréhension
                                  -= Liste_de_Mauvaise Rep ou compréhension
==


