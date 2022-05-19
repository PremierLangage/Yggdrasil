
extends= /model/basic/checkbox_rw.pl

 
question==
Parmi les arguments suivants, lesquels justifient un des points numérotés du calcul suivant?
$!z = -\overline{z} \underset{(1)}{\iff} a+ib= -(a-ib) \underset{(2)}{\iff} a+ib = -a+ib\underset{(3)}{\iff} 2a=0 \underset{(4)}{\iff} a=0 \underset{(5)}{\iff} z!$ est imaginaire pur.\\

==
 

nbitems=6
minright = 3
maxright = 3

right==
car $!a \times b=b\times a!$ pour $!a,b!$ deux réels 
car le carré d'un nombre est le produit de ce nombre par lui-même
en développant l'expression
==

wrong== 
car $!a+b=b+a!$ pour $!a,b!$ deux réels
en factorisant l'expression
en multipliant des deux côtés par le même réel
==

scoring = RightMinusWrong


Quels sont les arguments justifiant un des points numérotés du raisonnement suivant 


  \begin{reponses}
    \bonne{en divisant des deux côtés par le même nombre.}\bareme{b=1}
    \mauvaise{car si la partie imaginaire est nulle, le nombre est imaginaire pur.}\bareme{b=1}
    \mauvaise{car $z = \overline{z}$}\bareme{b=1}
    \bonne{en ajoutant $a-ib$ des deux côtés}\bareme{b=1}
    \bonne{en développant}\bareme{b=1}
    \mauvaise{Je n'en ai aucune idée}\bareme{b=0}