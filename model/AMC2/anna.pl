
extends= /model/AMC2/QCM-AMCE.pl

title= Anna's Exo

text=

questions==



==

doc==
On respecte le format standart des AMC selon le lien suivant : https://www.auto-multiple-choice.net/auto-multiple-choice.fr/AMC-TXT.shtml


* AMC avec possibilité d'un seul choix de réponse et donc une seule bonne réponse possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

** AMC avec possibilité de plusieurs choix de réponse et donc plusieurs bonnes réponses possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

*+ Cliquer sur les mots ; mettre les bonnes réponses entre accolades {{ }}
Réponse à mettre sous la forme : >

=* AMC avec possibilité d'une seule bonne réponse parmi une liste ou une compréhension python sur une ligne
Réponses à mettre sous la forme : += Liste_de_Bonne_Rep ou compréhension
                                  -= Liste_de_Mauvaise Rep ou compréhension

Pour chaque question, on peut mettre des options entre [] :
[group=] pour qu'il choisisse au hasard un exo parmi ceux qui ont le même tag

[nb=] pour déterminer le nombre de réponse pour un radio

[nbb=,nbg=] pour déterminer le nombre de bonne et de mauvaise réponse pour un checkbox 
==




