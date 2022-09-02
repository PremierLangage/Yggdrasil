extends= /model/basic/checkbox_rw.pl

title = Décortiquer une preuve

question==
Parmi les arguments suivants, lesquels justifient un des points numérotés du calcul suivant fait pour $!a,b!$ deux nombres réels?
$!
\begin{array}{ll}
(a+b)^2&\underset{(1)}{=}(a+b)(a+b)\\\\
	&\underset{(2)}{=}(a+b)a+(a+b)b\\\\
	&\underset{(3)}{=}a(a+b)+b(a+b)\\\\
	&\underset{(4)}{=}a^2+ab+ba+b^2\\\\
	&\underset{(5)}{=}a^2+2ab+b^2
\end{array}!$
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

scoring = CorrectItems


reroll = False
