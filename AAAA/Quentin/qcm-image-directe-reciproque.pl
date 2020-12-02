

extends = /model/AMC_TXT.pl


author = Quentin
bij =$ /AAAA/Quentin/Images/bij.png



title= Injectivité / Surjectivité
questions==



* On considère l’application $!f : \{1, 2, 3, 4\} \to \{1, 2, 3, 4\}!$ définie par
$!f (1) = 2, f (2) = 3, f (3) = 4, f (4) = 2.!$ Quelle est la bonne réponse ?
- $!f^{(-1)}(\{2\})=\{1\}!$
- $!f^{(-1)}(\{2\})=\{3\}!$
- $!f^{(-1)}(\{2\})=\{4\}!$
+ $!f^{(-1)}(\{2\})=\{1,4\}!$ 

* La fonction $!f:\mathbb R \to \mathbb R_+!$, $!x\mapsto \exp(x)!$ est-elle injective ?   
- Non 
+ Oui 

* La fonction $!f:\mathbb R \to \mathbb R_+!$, $!x\mapsto \exp(x)!$ est-elle surjective ?  
+ Non
- Oui 

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







