
extends=/model/AMC_TXT.pl 

title= QCM régulier - non régulier

message = Le langage suivant est-il est régulier ou non-régulier?

lalistedesquestions==
* {{ message }} {a^nb^m|\exists p\ n+m = 2p}
+ régulier
- non régulier
- aucune idée

* {{ message }} L2
+ régulier
- non régulier
- aucune idée

* {{ message }} L3
+ régulier
- non régulier
- aucune idée
==



# une étoile radio deux check box
questions= lalistedesquestions








