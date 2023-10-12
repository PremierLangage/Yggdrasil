

extends=regexp1.pl 

title = La méthode match

text==

Ecrire une fonction **number(motif,texte)** qui retourne le nombre d'occurrence du motif dans le texte.  

==




pltest==
>>> number("[Tt]oto","toto est la") #  [Tt]oto au début de "toto est la" 
1
>>> number("[Tt]oto","toto au debut puis Toto au milieu et à la fin toto")
3
>>> number("[Tt]oto","Non non pas de confiture.") #  [Tt]oto absent
0
==



