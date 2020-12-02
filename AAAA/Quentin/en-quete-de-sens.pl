
extends = /model/AMC_TXT.pl
author = Quentin
title= En quête de sens ...
questions==


* Soient $!E!$ et $!F!$ deux ensembles et soit $!f:E \to F!$ une application. Soient $!A\subset E!$ et $!B \subset F!$. Identifier l'assertion qui n'a pas de sens mathématiquement parlant. 
-$!f(A) \subset E!$
+ $!\forall y \in B, \quad !f^{(-1)}(y) \in A_1!$
- $! A \subset f^{(-1)}(B) !$
- $! f^{(-1)}(B) = \emptyset !$

* Soient $!E!$, $!F!$ et $!G!$ trois ensembles et soient $!f:E \to F!$ et $!g:F\to G!$ deux applications. Soient $!A\subset E!$, $!B \subset F!$ et $!C\subset G!$. Identifier l'assertion qui n'a pas de sens mathématiquement parlant. 
-$!(g\circ f)(A)=G!$
- $!g(B)=\emptyset!$
+ $!(g\circ f)^{(-1)}(C)=B!$
- $! f^{(-1)}(B) \subset A !$


* Soient $!E!$, $!F!$ et $!G!$ trois ensembles. Soit $!B\subset F!$ avec $!B \neq F!$. Soient $!f:E \to F!$ et $!g:B\to G!$ deux applications. Identifier l'assertion qui n'a pas de sens mathématiquement parlant. 
-$!g^{(-1)}(G)=B !$
+ $!f!$ est surjective mais $!g\circ f!$ ne l'est pas
- $!+ $!f^{(-1)}(B)=E!$ et $!g\circ f!$ est surjective

*Soit $!f: \mathbb R\to \mathbb R^2!$ une application. Identifier l'assertion qui n'a pas de sens mathématiquement parlant. 
- $!f^{(-1)}(\mathbb R^2)\subset [1,6]!$
+ $!f^{(-1)}([1,+\infty[)\subset \mathbb R_+!$
- $!f(\\{2\\})=\\{(4,3)\\}!$
- $!f([1,2])=[1,6]\cup[3,10]!$ 

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







