
# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Suites et Fonctions (MK)


# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 4

title= carroussel borne supérieure


intro ==
Ce quiz contient {{nbstep}} questions.

==

questions==

** Cocher les propositions vraies : 
+ Toute partie non vide majorée de $%\mathbb{R} %$ admet une borne sup.
- Toute partie non vide majorée de $%\mathbb{R} %$ admet un plus grand élément.
+ La borne sup d'une partie d'un ensemble ordonné est le plus petit des majorants de cette partie. 
- Toute partie majorée de $%\mathbb{R} %$ admet une borne sup.
- Toute partie non vide majorée de $%\mathbb{Q} %$ admet une borne sup.
+ Toute partie non vide majorée de $%\mathbb{Z}%$ admet un plus grand élément. 

** Soit $%A%$ une partie de $%\mathbb{R} %$ et $%a %$ un réel. Cocher les propositions vraies : 
- Si $% a%$ est la borne sup de $%A%$, alors  $% a%$ est le plus grand élément de $%A%$.
+ Si $% a%$ est le plus grand élément de $%A%$, alors  $% a%$ est la borne sup de $%A%$.
+ Si $% a%$ est le plus grand élément de $%A%$, alors $% a \in A%$.
- Si $% a%$ est la borne sup de $%A%$, alors $% a \in A%$.
-  Si $% a%$ est la borne sup de $%A%$, alors $% a \notin A%$.

** Soit $%(E, \le )%$ un ensemble ordonné $%A%$ une partie de $%E%$ et $%a\in E%$. 
+ $%a%$ est un majorant de $%A%$ si ($% \forall x \in A \quad x \le a%$).
- $%A%$ est majorée si ($% \forall x \in A \quad \exists m \in E \quad  x \le m%$).
+ $%A%$ est majorée si ($% \exists m \in E \quad \forall x \in A \quad  x \le m%$).
+ $%a%$ est le plus grand élément de $%A%$ si : \quad  ($% \forall x \in A \quad x \le a \quad %$ et $% \quad a \in A%$).
- $%a%$ est le plus petit élément de $%A%$ si  : \quad ($% \forall x \in A \quad a \le x%$).
+ $%a= \sup(A)%$ si [($% \forall x \in A \quad x \le a%$) et ($% \forall b \in E \quad  (\forall x \in A \quad x \le b) \implies a \le b %$)
- $%a= \inf(A)%$ si :  [($% \forall x \in A \quad a \le x%$) et ($% \forall b \in E \quad  (\forall x \in A \quad b \le x) \implies a \le b %$)

** Dans cette exercice $%f%$ désigne une fonction numérique et $% I%$ une partie de $%\mathbb{R}%$. Cocher les propositions vraies :
- Si $% f %$ est croissante et $% I %$ est borné, alors $%f(I)%$ est borné et $% \sup(f(I)) = f(\sup(I)) %$
- Si $% f %$ est croissante et $% I %$ est borné, alors $%f(I)%$ est borné et $% \sup(f(I)) > f(\sup(I)) %$
+ Si $% f %$ est croissante et $% I %$ est  majorée, alors $%f(I)%$ est majorée et $% \sup(f(I)) \le  f(\sup(I)) %$
+  Si $% f %$ est croissante et $% I %$ est admet un plus grand élément, alors $%f(I)%$ aussi et $% \max(f(I)) = f(\max(I)) %$
  
==