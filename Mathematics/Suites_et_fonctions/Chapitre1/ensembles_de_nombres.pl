
# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Suites et Fonctions (MK)


# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 4

title= carroussel ensembles de nombres


intro ==
Ce quiz contient {{nbstep}} questions.

Dans toutes les questions $%\mathbb{D}%$ désigne l'ensemble des nombres décimaux (qui s'écrivent avec un nombre fini de décimales derrière la virgule), $! e = \exp(1)!$
==

questions==

** Parmi les affirmations suivantes, lesquelles sont vraies 
+ $%\frac{1}{2} \in \mathbb{Q}%$
+ $% \frac{1}{3} \in \mathbb{Q}%$
+ $%\frac{1}{2} \in \mathbb{D}%$
- $% \frac{1}{3} \in \mathbb{D}%$
+ $% \sqrt{2} \in \mathbb{R} \setminus \mathbb{Q} %$
- $% 3-7 \in \mathbb{N} %$
- $% \frac{e}{2} \in \mathbb{Q} %$





** Cocher les propositions vraies :
+ $%\forall x \in \mathbb{D} \quad x \in \mathbb{Q} %$
+ $%\forall x, y \in \mathbb{D}  \quad xy \in \mathbb{D} %$
- $%\forall x, y \in \mathbb{Q} \setminus \mathbb{D} \quad xy \in  \mathbb{Q} \setminus \mathbb{D} %$
-  $% \forall x, y \in \mathbb{R} \setminus \mathbb{Q}  \quad x+y \in \mathbb{R} \setminus \mathbb{Q} %$
+ $% \forall x \in \mathbb{Q} \quad -x \in \mathbb{Q} %$
+ $% \forall x \in \mathbb{Q}^* \quad \frac{1}{x} \in \mathbb{Q} %$
- $% \forall x \in \mathbb{N} \quad -x \in \mathbb{N} %$
+ $% \forall x \in \mathbb{Z}^* \quad \frac{1}{x} \in \mathbb{Z} %$

** Cocher les propositions vraies :
- $% \\{1,-2,3\\} \subset \mathbb{N} %$
- $% [1,2] \subset \mathbb{N} %$ 
+  $%\\{ \frac{1}{2}, \frac{1}{5}, \frac{7}{4}\\} \subset \mathbb{D} %$ 
-  $%\\{ \frac{1}{2}, \frac{1}{3}, \frac{7}{4}\\} \subset \mathbb{D} %$ 
+  $%\\{ \sqrt{2}, e, \frac{\pi}{2} \\} \subset \mathbb{R}\setminus \mathbb{Q} %$
-  $%\\{ \sqrt{2},\sqrt{3},\sqrt{4}  \\} \subset \mathbb{R}\setminus \mathbb{Q} %$  

** Cocher les propositions vraies 
+ Si $% I %$ et $% J %$ sont des intervalles de $%\mathbb{R}%$  alors $% I \cap J%$ est un intervalle de $%\mathbb{R}%$
- Si $% I %$ et $% J %$ sont des intervalles de $%\mathbb{R}%$  alors $% I \cup J%$ est un intervalle de $%\mathbb{R}%$
- Si $% I %$ est un intervalle borné de $% \mathbb{R}%$, alors $%a = \inf(A)%$ et $% b = \sup(B)%$ sont des réels et $%I=[a,b]%$
+ Si $% I %$ est un intervalle ni majoré ni minoré  de $% \mathbb{R}%$, alors $%A= \mathbb{R}%$
+ Si $% A %$ et $% B %$ sont des parties bornées de $% \mathbb{R} %$, alors $%\sup (A \cup B)= \max( \sup(A), \sup (B))%$
+ Si $% A %$ et $% B %$ sont des parties bornées de $% \mathbb{R} %$, alors $%\sup (A \cap B)= \min( \sup(A), \sup (B))%$
==
