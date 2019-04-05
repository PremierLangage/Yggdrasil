# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Les saisons
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Quelle saison

Déterminer la saison à laquelle appartient la date saisie, et afficher un message du type :

Cette date est en ... suivi du nom de la saison. On rappelle que les dates des saisons
sont :

• Printemps : du 20 mars au 19 juin,
• Été : du 20 juin au 21 septembre,
• Automne : du 22 septembre au 20 décembre,
• Hiver : du 21 décembre au 19 mars




Remarque:
    vous pouvez recopier le code de la question précédente.

==

code==
jour=int(input())
mois=int(input())
annee=int(input())

"Cette date est en "
"Printemps"
"Été"
"Automne"
"Hiver"



==

input0==
4
1
1988
==

input1==
29
3
2000
==

input2==
31
7
0400
==

input3==
29
9
2301
==

input4==
29
9
2301
==


soluce==
jour=int(input())
m=int(input())
annee=int(input())

if m <3 or ( m==3 and jour < 20):
    print("Cette date est en Hiver")
elif m <6 or ( m==6 and jour < 20):
    print("Cette date est en Printemps")
elif m <9 or ( m==9 and jour < 22):
    print("Cette date est en Été")
elif m <12 or ( m==12 and jour < 22):
    print("Cette date est en Automne")
else:
    print("Cette date est en Hiver")

==

