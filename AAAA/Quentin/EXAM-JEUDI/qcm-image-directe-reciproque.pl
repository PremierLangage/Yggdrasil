extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl
author = Enseignants Méthodologie
title= Image directe/réciproque
questions==


* Soient $!E!$ et $!F!$ deux ensembles. Soit $!B \subset F!$. L'image réciproque de l'ensemble $!B!$ est par définition: 
+ $! \\{ x \in E \\; | \\; f(x) \in B \\}!$
- $! \\{ y \in F \\; | \\; y \in  B \\}!$
- $! \\{ x \in E \\; | \\; f(x) \in B^c \\}!$



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




evaluator==
nb_attempt += 1
nb_good = 0
nb_bad = 0
grade_checks = 0
feedback_checks = "ok"
grade_checks = min([((nb_good*100) // (nb_good+nb_bad)) , (100 // (2**nb_bad))])
grade_attempt = 50 + (200 // (3+nb_attempt))
grade=((grade_checks * grade_attempt) // 10000, feedback)
==











