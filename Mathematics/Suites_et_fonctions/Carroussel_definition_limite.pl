
# Copyright 2020 Magdalena Kobylanski <magdalena.kobylanski@u-pem.fr>
author=Magdalena Kobylanski

title=Commandes Unix en terminal
tag=system|shell

extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl

nb_quest_voulu = 4

title= carroussel sur la défintion des limites de fonctions

intro ==
Ce quiz contient {{nbstep}} questions.

Dans toutes les questions, $% f%$ désigne une fonction réelle, définie sur $%\mathbb{R}%$.
==

questions==

* $%\lim_{x\to 0} f(x) = 2 %$ signifie :
+ $%\forall \varepsilon >0 \quad \exists \eta>0 \quad \forall x\in D_f \quad |x|\le \eta  \implies |f(x)-2|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x|\le \eta \implies |f(x)-2|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta\ge 0  \quad \forall x\in D_f \quad |x|\le \eta \implies |f(x)-2|\le \varepsilon %$

** $%\lim_{x\to 5^-} f(x) = -\infty %$ signifie :
+ $%\forall A \in \mathbb{R} \quad \exists \eta>0 \quad \forall x\in D_f \quad 5-\eta \le x\le 5 \implies f(x)\le A %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x-5|\le \eta \mbox{ et } x<5 \implies |f(x)-5|\ge \varepsilon %$
+ $%\forall \varepsilon >0 \quad \exists \eta>0 \quad \forall x\in D_f \quad |x-5|\le \eta \mbox{ et } x<5  \implies f(x)\le -\varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x-1|\le \eta \mbox{ et } x>1 \implies |f(x)-5|\ge \varepsilon %$
 


** $%\lim_{x\to +\infty} f(x) = 3 %$ signifie :
+ $%\forall \varepsilon >0 \quad \exists A \in \mathbb{R} \quad \forall x\in D_f \quad x \ge A  \implies |f(x)-3|\le \varepsilon %$
+ $%\forall \varepsilon >0 \quad \exists A>0 \quad \forall x\in D_f \quad x \ge A  \implies |f(x)-3|\le \varepsilon %$
+ $%\forall \varepsilon >0 \quad \exists \eta >0 \quad \forall x\in D_f \quad x \ge \eta  \implies |f(x)-3|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x|\le \eta \implies |f(x)-3|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x-3|\ge \eta \implies |f(x)-3|\le A %$

* $%\lim_{x\to 1^+} f(x) = 5 %$ signifie :
+ $%\forall \varepsilon >0 \quad \exists \eta>0 \quad \forall x\in D_f \quad 1<x\le 1+ \eta  \implies |f(x)-5|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x-1|\le \eta \mbox{ et } x>1 \implies |f(x)-5|\le \varepsilon %$
- $%\forall \varepsilon >0 \quad \exists \eta>0 \quad \forall x\in D_f \quad 1<x\le 1+ \eta  \implies |f(x)-3|\le \varepsilon %$
- $%\forall \varepsilon \ge 0 \quad \exists \eta>0  \quad \forall x\in D_f \quad |x-1|\le \eta \mbox{ et } x>1 \implies |f(x)-5|\ge \varepsilon %$
 



==




