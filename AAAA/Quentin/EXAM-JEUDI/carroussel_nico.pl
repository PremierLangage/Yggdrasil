
# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Méthodologie
bij =$ /AAAA/Quentin/Images/bij.png

# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 5

title= Carroussel

questions==



* Soient $!E!$ et $!F!$ deux ensembles. On dit que l'application $!f:E \to F!$ est injective si:
+ $! \forall x,x' \in E, \quad ( f(x)=f(x') \implies x=x')!$
-  $! \forall x,x' \in E, \quad ( x=x' \implies f(x)=f(x'))!$
-  $! \exists y \in F, \quad \forall x \in E, \quad  f(x)=y!$
-  $! \forall y \in F, \quad \exists x \in E,  \quad f(x)=y!$


* Soient $!E!$ et $!F!$ deux ensembles. On dit que l'application $!f:E \to F!$ est surjective si:
- $! \forall x,x' \in E, \quad ( f(x)=f(x') \implies x=x')!$
-  $! \forall x,x' \in E, \quad ( x=x' \implies f(x)=f(x'))!$
-  $! \exists y \in F, \quad \forall x \in E,\quad  f(x)=y!$
+  $! \forall y \in F, \quad \exists x \in E,\quad  f(x)=y!$

* Soient $!E!$ et $!F!$ deux ensembles. Soit $!B \subset F!$. L'image réciproque de l'ensemble $!B!$ est par définition: 
+ $! \\{ x \in E \\; | \\; f(x) \in B \\}!$
- $! \\{ y \in F \\; | \\; y \in  B \\}!$
- $! \\{ x \in E \\; | \\; f(x) \in B^c \\}!$


* Soit $!f:\mathbb R \backslash\\{0\\} \to \mathbb R!$ telle que $!f(x)=1/x!$ pour tout $! x \in \mathbb R \backslash\\{0\\}!$. L'application $!f!$ est-elle surjective ? 
+ Non
- Oui 


* L'application $!f:\mathbb R \to \mathbb [-1,+\infty[!$, $!x\mapsto x^2-1 !$ est-elle injective ?   
+ Non 
- Oui 

* L'application $!f:\mathbb R \to \mathbb [-1,+\infty[!$, $!x\mapsto x^2-1!$ est-elle surjective ?  
- Non
+ Oui


* On considère l'application $%f : \\left \\{1, 2, 3, 4 \\right \\} \to \\left \\{1, 2, 3, 4\\right \\}%$ définie par
$!f (1) = 4, f (2) = 1, f (3) = 2, f (4) = 2.!$ Quelle est la bonne réponse ?
- $!f^{\\{-1\\}}(\\{2\\})=\\{1\\}!$
- $!f^{\\{-1\\}}(\\{2\\})=\\{2\\}!$
- $!f^{\\{-1\\}}(\\{2\\})=\\{3\\}!$
+ $!f^{\\{-1\\}}(\\{2\\})=\\{3,4\\}!$ 

* On considère l'application $!f : \mathbb R \to \mathbb R!$ définie par
$!\forall x \in \mathbb  R, \; f (x) = 5 x^4 + 7.!$
Quelle est la bonne réponse ?
-$!f(\mathbb R)=\mathbb R!$
-$!f(\mathbb R)=[0,+\infty[!$
-$!f(\mathbb R)=]7,+\infty[!$
-$!f(\mathbb R)=[5,+\infty[!$
+$!f(\mathbb R)=[7,+\infty[!$

* On considère l’application $!f : \mathbb R \times \mathbb R \to \mathbb R!$ définie par
$!f (x, y) = x^2.!$
Quelle est la bonne réponse ?
- $! f^{\\{-1\\}}(\\{1\\}) = \\{(1, 0)\\}  !$
- $! f^{\\{-1\\}}(\\{0\\}) = \\{(-1,0),(1,0)\\}  !$
- $! f^{\\{-1\\}}(\\{1\\})= \\{ (x,y)\in \mathbb{R}^2 | x^2+y^2= 1\\} !$,  le cercle de rayon 1 et de centre $!(0,0)!$
+ $! f^{\\{-1\\}}(\\{1\\}) = \\{(x, y)  |  x\in \\{-1,+1\\},  y \in \mathbb R\\}  !$

==


