extends = /model/AMC_TXT.pl
author = Quentin
title= Image directe/réciproque
questions==


* Soient $!E!$ et $!F!$ deux ensembles. Soit $!B \subset F!$. L'image réciproque de l'ensemble $!B!$ est par définition: 
+ $! \\{ x \in E \\; | \\; f(x) \in B \\}!$
- $! \\{ y \in F \\; | \\; y \in  B \\}!$
- $! \\{ x \in E \\; | \\; f(x) \in \overline{B} \\}!$



* On considère l'application $%f : \\left \\{1, 2, 3, 4 \\right \\} \to \\left \\{1, 2, 3, 4\\right \\}%$ définie par
$!f (1) = 2, f (2) = 3, f (3) = 4, f (4) = 2.!$ Quelle est la bonne réponse ?
- $!f^{(-1)}(\\{2\\})=\\{1\\}!$
- $!f^{(-1)}(\\{2\\})=\\{3\\}!$
- $!f^{(-1)}(\\{2\\})=\\{4\\}!$
+ $!f^{(-1)}(\\{2\\})=\\{1,4\\}!$ 

* On considère l'application $!f : \mathbb R \to \mathbb R!$ définie par
$!\forall x \in \mathbb  R, \; f (x) = x^2 + 1.!$
Quelle est la bonne réponse ?
-$!f(\mathbb R)=\mathbb R!$
-$!f(\mathbb R)=[0,+\infty[!$
-$!f(\mathbb R)=]1,+\infty[!$
+$!f(\mathbb R)=[1,+\infty[!$

* On considère l’application $!f : \mathbb R \times \mathbb R \to \mathbb R!$ définie par
$!f (x, y) = x^2 + y^2.!$
Quelle est la bonne réponse ?
- $! f^{(-1)}(\\{1\\}) = \\{(1, 0)\\}  !$
- $! f^{(-1)}(\\{0\\}) = \\{(0, 1)\\}  !$
+ $! f^{(-1)}(\\{1\\}) !$ est le cercle de rayon 1 et de centre $!(0,0)!$

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







