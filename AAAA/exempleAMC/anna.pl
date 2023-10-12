
extends= /model/AMC2/QCM-AMCE.pl

title= Anna's Exo

text=


questions==

**[group=prenom] Quel est le prénom de Revuz
+Dominique
-Christian
+Paul
+Edouard

*[group=prenom] Quel est le prénom de Diaw
+Anna
-Aminata
-Claire

*+ Clicker sur la bonne conjugaison du verbe  
>Je suis ( aller / {{allé}} ) au bureau hier

=**[nbb=2,nbg=2] Choisir les mots qui sont des mots clefs de python
+=["assert","async","await","break","class","continue","def","del","else","except","finally"]
-=["whiles","boucle","attend","cause","deff","dep"]

=*[nb=5,group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]

=*[nb=3,group=odd] What are the even numbers ? 
-=[x for x in range(3,77) if x%2==1 ]# { x telque x €[3,77[ and x in \Cap(N) / x est impair}
+=[x for x in range(3,77) if x%2==0 ]

==


docXXXXX==
On respecte le format standart des AMC selon le lien suivant : https://www.auto-multiple-choice.net/auto-multiple-choice.fr/AMC-TXT.shtml


* AMC avec possibilité d'un seul choix de réponse et donc une seule bonne réponse possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

** AMC avec possibilité de plusieurs choix de réponse et donc plusieurs bonnes réponses possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

*+ Cliquer sur les mots ; mettre les bonnes réponses entre doubes accolades 
Réponse à mettre sous la forme : >

=* AMC avec possibilité d'une seule bonne réponse parmi une liste ou une compréhension python sur une ligne
Réponses à mettre sous la forme : += Liste_de_Bonne_Rep ou compréhension
                                  -= Liste_de_Mauvaise Rep ou compréhension

Pour chaque question, on peut mettre des options entre [] :
[group=] pour qu'il choisisse au hasard un exo parmi ceux qui ont le même tag

[nb=] pour déterminer le nombre de réponse pour un radio

[nbb=,nbg=] pour déterminer le nombre de bonne et de mauvaise réponse pour un checkbox 
==




