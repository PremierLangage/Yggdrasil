Copyright 2020 Magdalena Kobylanski <magdalena.kobylanski@u-pem.fr>
# author=Magdalena Kobylanski

title=Commandes Unix en terminal
tag=system|shell

extends=/model/AMC_TXT.pl

title==
QCM sur la partie entière 
==

intro ==
Ce quiz contient {{nbstep}} questions.

==

questions==

La fonction partie entière d'un réel $%x%$, que l'on note $%E(x)%$  est définie,  comme l'unique entier $%n%$ tel que $%n\le x < n+1%$

CALCULER 
1) $%E(x)%$ pour $%x = 3/2, -3/2, $%\pi%$, $%- \pi %$
2) Calculer des valeurs aléatoires de E(x) 
3) Calculer E(10 \pi)/10, E(100 \pi)/100, E(10 e)/10, E(100e)/100
4) Pour $%x= 1/2%$ trouver y_0\in ]0,1[ tel que E(x+y_0)=0 et y_1\in ]0,1[ tel que E(x+y_1)=0 
5) même question pour x random dans {5,..., }/10
6) Pour x \in \mathbb{R} trouver y \in ]0,1[ tel que  E(x+y)= E(x)
7) A-t-on, pour tout x,y \in \mathbb{R} E(x)+E(y) \le E(x+y) \le E(x)+E(y) +1 (vrai)

** Cocher les bonnes réponses 
+ Pour tout $%x \in \mathbb{R}%$ et pour tout $%n \in \mathbb{Z} \quad  E(x+n)= E(x)+n %$
- Pour tout $%x \in \mathbb{R}%$ et pour tout $%n \in \mathbb{Q}  \quad E(x+n)= E(x)+n %$
- La fonction $%x \mapsto E(x)%$ est impaire 
- La fonction $%x \mapsto E(x)%$ est périodique de période $%1%$
+ La fonction $%x \mapsto x-E(x)%$ est périodique de période $%1%$

** Cocher les bonnes réponses 
+ $% \forall x \in \mathbb{R} E(x) \le x < E(x)+1 $%
+ $% \forall x \in \mathbb{R} E(x) \le x \le E(x)+1 $%
- $% \forall x \in \mathbb{R} E(x) +1 \ge x > E(x) $%
+ $% \forall x \in \mathbb{R} x-1 < E(x) \le x  $%
- $% \forall x \in \mathbb{R} x-1 \le E(x) < x  $%
- $% \forall x \in \mathbb{R} x \le E(x) \le x +1 $%
==