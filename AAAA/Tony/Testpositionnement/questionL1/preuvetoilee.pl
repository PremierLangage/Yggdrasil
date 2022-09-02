extends= /model/basic/checkbox_rw.pl

title = Décortiquer une preuve
 
question==
Parmi les arguments suivants, lesquels justifient un des points numérotés du calcul suivant?

$!
\begin{array}{ll}
z = -\overline{z} &\underset{(1)}{\iff} a+ib= -(a-ib) \\\\
&\underset{(2)}{\iff} a+ib = -a+ib \\\\
&\underset{(3)}{\iff} 2a=0 \\\\
&\underset{(4)}{\iff} a=0 \\\\
& \underset{(5)}{\iff} z\textrm{ est imaginaire pur}.
\end{array}!$ 

==
 

nbitems=5
minright = 3
maxright = 3

right== 
en divisant des deux côtés par le même nombre.
en ajoutant $!a-ib!$ des deux côtés
en développant
==

wrong==  
car si la partie imaginaire est nulle, le nombre est imaginaire pur.
car $!z = \overline{z}!$
==

scoring = CorrectItems

reroll = False