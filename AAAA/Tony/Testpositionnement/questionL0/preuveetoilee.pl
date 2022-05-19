extends= /model/basic/checkbox_rw.pl

 
question==
Parmi les arguments suivants, lesquels justifient un des points numérotés du calcul suivant fait pour $a,b$ deux nombres réels?
\begin{equation*}
\begin{array}{ll}
(a+b)^2&\underset{(1)}{=}(a+b)(a+b)\\
	&\underset{(2)}{=}(a+b)a+(a+b)b\\
	&\underset{(3)}{=}a(a+b)+b(a+b)\\
	&\underset{(4)}{=}a^2+ab+ba+b^2\\
	&\underset{(5)}{=}a^2+2ab+b^2
\end{array}
\end{equation*}
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!(0,0,0)!$
$!(0,1,-1)!$
==

wrong==
$!(1,1,2)!$
$!(-1,0,2)!$
==

scoring = RightMinusWrong


  \begin{reponses}
    \bonne{car $a \times b=b\times a$ pour $a,b$ deux réels}\bareme{b=1}
    \mauvaise{car $a+b=b+a$ pour $a,b$ deux réels}\bareme{b=1}
    \bonne{car le carré d'un nombre est le produit de ce nombre par lui-même}\bareme{b=1}
    \bonne{en développant l'expression}\bareme{b=1}
    \mauvaise{en factorisant l'expression}\bareme{b=1}
    \mauvaise{en multipliant des deux côtés par le même réel}\bareme{b=1}