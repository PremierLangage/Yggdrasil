
# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/model/AMC_TXT.pl


author = Enseignants Suites et Fonctions (MK)


# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 4

title= carroussel partie entière


intro ==
Ce quiz contient {{nbstep}} questions.

La partie entière d'un réel $%x%$, notée $%E(x)%$  est définie,  comme l'unique entier $%n%$ tel que $%n\le x < n+1%$

==

questions==


** Cocher les bonnes réponses 
+ $%E(3/2) = 1%$ 
+ $%E(\pi) =3 %$
- $%E(\pi) =4 %$
- $%E(-3/2)=-1%$ 
+ $%E(-\pi)= -4%$
- $%E(-\pi)= -3%$


** Cocher les bonnes réponses 
+ Pour tout $%x \in \mathbb{R}%$ et pour tout $%n \in \mathbb{Z} \quad  E(x+n)= E(x)+n %$
- Pour tout $%x \in \mathbb{R}%$ et pour tout $%n \in \mathbb{Q}  \quad E(x+n)= E(x)+n %$
- La fonction $%x \mapsto E(x)%$ est impaire 
- La fonction $%x \mapsto E(x)%$ est périodique de période $%1%$
+ La fonction $%x \mapsto x-E(x)%$ est périodique de période $%1%$

** Cocher les bonnes réponses 
+ $% \forall x \in \mathbb{R}  \quad E(x) \le x < E(x)+1 %$
+ $% \forall x \in \mathbb{R} \quad E(x) \le x \le E(x)+1 %$
- $% \forall x \in \mathbb{R} \quad E(x) +1 \ge x > E(x) %$
+ $% \forall x \in \mathbb{R} \quad x-1 < E(x) \le x  %$
- $% \forall x \in \mathbb{R}\quad  x-1 \le E(x) < x  %$
- $% \forall x \in \mathbb{R} \quad x \le E(x) \le x +1 %$
+ $% \forall x,y \in \mathbb{R} \quad E(x)+E(y) \le E(x+y) \le E(x)+E(y) +1 %$
==
