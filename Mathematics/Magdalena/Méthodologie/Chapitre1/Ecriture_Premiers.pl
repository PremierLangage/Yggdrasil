extends = /model/AMC_TXT.pl
title = Ecriture "Divise",  "Nombres Premiers" et "Nombres premiers entre eux" 
questions==

questions==

** Cochez les bonnes réponses. Ecrire en revenant aux éléments premiers du langage que l'entier $%a%$ divise l'entier $%b%$ .
- $% a, b  \in \mathbb{N}  \quad a= k\times b %$
- $% a, b  \in \mathbb{N}  \quad b= k\times a %$
-  $% a, b  \in \mathbb{N}  \quad \exists k \in \mathbb{N} \quad  a= k\times b %$
-  $% a, b  \in \mathbb{N}  \quad \forall k \in \mathbb{N} \quad  b= k\times a %$
+  $% a, b  \in \mathbb{N}  \quad \exists k \in \mathbb{N} \quad  b= k\times a %$


** Cochez les bonnes réponses. Ecrire formellement que les entier $%a%$  et $%b%$ sont premiers entre eux en utilisant le symbole divise $% | %$.
- $% p | a \\; \mbox{ et } \\; p | b \\; p=1 %$
- $%  \mbox { Si } \\; p | a \\; \mbox{ et } \\; p | b \\;, \mbox{ alors }  p=1 %$
+ $% \forall p \in \mathbb{N} \\;  \mbox { Si } \\; p | a \\; \mbox{ et } \\; p | b \\;, \mbox{ alors }  p=1 %$
- $% \forall p \in \mathbb{N} \\;   \\; p | a \\; \mbox{ et } \\; p | b \\;, \mbox{ donc }  p=1 %$

** Cochez les bonnes réponses. Ecrire formellement que l'entier $%p%$ est premier en utilisant le symbole divise $% | %$ .

- $% 1 | p \\; \mbox{ et } \\; p |p %$
- $% \exists d \in \mathbb{N}^* \quad d | p \quad (d=1 \\; \mbox{ ou } \\;  d=n) %$
- $% \\{ d \in \mathbb{N} \\; | \\; d | p \\} = \\{1, p\\} %$
+ $% \\{ d \in \mathbb{N} \\; | \\; d | p \\} = \\{1, p\\} \quad  %$ et  $% \quad (p \ge 2) %$
+ $%(p \ge 2 )\quad  %$ et $%  \quad (\forall d \in \mathbb{N} \\; \mbox{ si } d | p, \\;  \mbox{ alors } \\; (d=1  \\; \mbox{ ou } \\; d=p))%$.
 
==

