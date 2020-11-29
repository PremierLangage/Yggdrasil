
extends = /model/AMC_TXT.pl


author = Quentin


title= Injectivité
questions==

* La fonction $!f:\mathbb R \to \mathbb R_+!$, $!x\mapsto \exp(x)!$ est-elle injective ?   
- Non 
+ Oui 

* La fonction $!f:\mathbb R \to \mathbb R_+!$, $!x\mapsto \exp(x)!$ est-elle surjective ?  
+ Non
- Oui 
==



before ==#|python|
# Some globals variables
nb_attempt=0
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




