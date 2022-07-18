extends = /model/AMC_TXT.pl
title = Autour des définitions
questions==


** Comment s'écrit "la suite $%(u_n)_{n\ge 0}%$ ne converge pas vers 0"?
- $%\forall \epsilon > 0 \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  |u_n| \le \varepsilon %$
- $%\forall \epsilon > 0 \quad \exists n_0 \in \mathbb{N} \quad \forall n \ge n_0 \quad  |u_n| > \varepsilon %$
- $%\forall \epsilon > 0 \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  |u_n| \le \varepsilon %$
- $%\exists \epsilon > 0 \quad  \forall n_0 \in \mathbb{N} \quad  \exists n \ge n_0 \quad  |u_n| \le \varepsilon %$
+ $%\exists \epsilon > 0 \quad  \forall n_0 \in \mathbb{N} \quad  \exists n \ge n_0 \quad  |u_n| > \varepsilon %$
- $%\exists \epsilon > 0 \quad  \forall n_0 \in \mathbb{N} \quad  \exists n \ge n_0 \quad  |u_n| \le \varepsilon %$

** Comment s'écrit **la suite $%(u_n)%$ tend vers  $%+\infty%$**?
- $%\forall A > 0 \quad \forall \epsilon > 0 \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  |u_n-A| \le \varepsilon %$
+ $%\forall A > 0 \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  u_n \ge A %$
- $%\forall A > 0 \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  u_n \le A %$
+ $%\forall A \in \mathbb{R} \quad \exists n_0 \in \mathbb{N} \quad  \forall n \ge n_0 \quad  u_n \ge A %$

** Soit $%A%$ une partie de $%\mathbb{R}%$. Que signifie **$%\forall x \in \mathbb{R} \quad  \exists x \in A \quad y > x %$**?
- $%A%$ est majorée. 
- $%A%$ est minorée.
- $%A%$ est bornée.
+ $%A%$ n'est pas majorée. 
- $%A%$ n'est pas minorée.
- $%A%$ n'est pas bornée.

** Soit $%A%$ une partie de $%\mathbb{R}%$. Que signifie "2 est le plus grand élément de A"
+ $%2\in A%$ et $% \forall x \in A \quad x\le 2%$.
- $% \forall x \in A \quad x\le 2%$.
- $% \forall x \in A \quad x\le 2%$ et $%\forall \varepsilon >0 \quad \exists x \in A \quad x> a-\varepsilon%$.
+ 2 est un élément de $%A%$ et 2 est un majorant de $%A%$

** Soit $%A%$ une partie de $%\mathbb{R}%$. Que signifie "2 est la borne supérieure de A"
- $%2\in A%$ et $% \forall x \in A \quad x\le 2%$.
- $% \forall x \in A \quad x\le 2%$.
+ $% \forall x \in A \quad x\le 2%$ et $%\forall \varepsilon >0 \quad \exists x \in A \quad x> a-\varepsilon%$.
- 2 est un élément de $%A%$ et 2 est un majorant de $%A%$
+ $% \forall x \in A \quad x\le 2%$ et $%\forall b \in \mathbb{R} \quad  \forall x \in A \quad x \le b \implies a \le b%$.
+ 2 est le plus petit des majorants de A.

==


