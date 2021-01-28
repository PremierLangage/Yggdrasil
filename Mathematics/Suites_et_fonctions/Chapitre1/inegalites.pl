
# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Suites et Fonctions (MK)


# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 4

title= carroussel inégalités

intro ==
Ce quiz contient {{nbstep}} questions.

==

questions==

**  $%f%$ désigne une fonction numérique et $%I%$ et $%J%$ des parties de $%\mathbb{R}%$. Cocher les propositions vraies
- Si $% a, b %$ sont des réels et $%a \le b %$, alors $% \frac{1}{a} \ge \frac{1}{b} %$
+ Si $% a, b %$ sont des réels strictement négatifs  et $%a \le b %$, alors $% \frac{1}{a} \ge \frac{1}{b} %$
- Si $%a,b %$ sont des réels et $%a \le b %$, alors $% a^2 \le b^2 %$
+ Si $% a, b %$ sont des réels strictement négatifs  et $%a \le b %$, alors $% a^2 \ge b^2 %$
- Si $%f%$ est  croissante sur  $%I%$ et  croissante sur $%J%$, alors $% f%$ est croissante sur $%I \cup J%$.
+ Si $%f%$ est  croissante sur  $%I%$ et croissante sur $%J%$ et $% I \cap J \neq \emptyset %$, alors $% f%$ est croissante sur $%I \cup J%$.



** Cocher les propositions vraies :
-  $% \forall a,b,c  \in \mathbb{R} \quad a \le b  \implies ac \le bc %$ 
+ $% \forall a,b  \in \mathbb{R}\; \forall c \in \mathbb{R}^+ \quad a \le b  \implies ac \le bc %$ 
+ $% \forall a,b,c  \in \mathbb{R} \quad a \le b  \implies a + c \le b+ c %$ 
- $% \forall a,b  \in \mathbb{R}\quad  \forall c \in \mathbb{R}^+ \quad a \le b  \implies \frac{a}{c} \le \frac{b}{c} %$ 




 

** Cocher les propositions vraies 
+  $% \forall a,b \in \mathbb{R}  \quad  |a| \le |a+b| + |b| %$
+  $% \forall a,b \in \mathbb{R} \quad   |a| \le |a-b| + |b| %$
-  $% \forall x,y \in \mathbb{R} \quad  |x| \le |x+y| - |y| %$
+ $% \forall x,y \in \mathbb{R}  \quad  |x| - |y| \le |x-y| %$
+ $% \forall x,y \in \mathbb{R} \quad   |x| \le a  \Leftrightarrow  -a \le x \le a %$
+ $% \forall x,y \in \mathbb{R} \quad  ||x|-|y|| \le |x+y| \le [x] + |y| %$

==
