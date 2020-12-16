
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Méthodologie
bij =$ /AAAA/Quentin/Images/bij.png



title= Injectivité / Surjectivité
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


* Soit $!f:\mathbb R \backslash\\{0\\} \to \mathbb R!$ telle que $!f(x)=1/x!$ pour tout $! x \in \mathbb R \backslash\\{0\\}!$. L'application $!f!$ est-elle surjective ? 
+ Non
- Oui 


* L'application $!f:\mathbb R \to \mathbb [-1,+\infty[!$, $!x\mapsto x^2-1 !$ est-elle injective ?   
+ Non 
- Oui 

* L'application $!f:\mathbb R \to \mathbb [-1,+\infty[!$, $!x\mapsto x^2-1!$ est-elle surjective ?  
- Non
+ Oui

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











