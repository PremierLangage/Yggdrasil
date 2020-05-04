
extends=/model/AMC_TXT.pl 

title= QCM régulier - non régulier

message = Le langage suivant est-il est régulier ou non-régulier?

# une étoile radio deux check box
questions==
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

* La propriété suivante est-elle vraie pour tout langage L et mot u
P - Si $u\in \Sigma^*$ et $L\subseteq \Sigma^*$ alors $u.L=L.u$

- oui
+ non
- aucune idée


* Si $L$ et $L'$ sont des langages réguliers alors $L.L'$ est un langage régulier.
* Si $L$ est régulier et $L'$ n'est pas régulier alors $L.L'$ n'est pas régulier.
* Si $L.L'$ n'est pas régulier alors $L$ et $L'$ ne sont pas réguliers.
* Si $L.L'$ n'est pas régulier alors au moins $L$ ou $L'$ n'est pas régulier.
==








