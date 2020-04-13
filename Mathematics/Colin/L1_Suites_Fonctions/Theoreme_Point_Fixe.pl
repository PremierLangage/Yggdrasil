author=Colin Petitjean

title=Théorème du point fixe 
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

* Soit $%f : \mathbb{R} \to \mathbb{R} %$ une fonction. On dit que $%x_0%$ est un point fixe de $%f%$ si :
+ $%f(x_0) = x_0 %$
- $%f(x_0) \geq  x_0 %$
- $%f(x_0) \leq  x_0 %$
- $%f(x_0) \neq x_0 %$


** Quelles sont les hypothèses du théorème de point fixe mentionné dans la vidéo "3-1 Théorème de point fixe" (existence d'un unique point fixe) ?
+ On considère une fonction $%f : [a,b] \to [a,b]%$ où $% a<b %$
- On considère une fonction $%f : [a,b[ \to [a,b[%$ où $% a<b %$ 
+ On suppose que la fonction $%f%$ est contractante.
- On suppose que la fonction $%f%$ est Lipschitzienne.
- On suppose que la fonction $%f%$ est 1-Lipschitzienne.
- On considère une fonction $%f : ]a,b[ \to ]a,b[%$ où $% a<b %$

** Soit  $%f : [a,b] \to [a,b]%$ (où $% a<b %$) une fonction $%K%$-Lipschitzienne avec $%0<K<1%$. 
On note $x_0$ l'unique point fixe de $%f%$ donné par le théorème du point fixe.
On définit la suite $% (u_n)_{n \in \mathbb \N} %$ par $%u_0 = a%$ et $% u_{n+1} = f(u_n) %$.
Que dire de cette suite (plusieurs bonnes réponses) ? 
+ Elle converge vers l'unique point fixe de $%f%$.
- Elle est croissante.
- Elle est décroissante.
- Elle n'admet pas de limite.
+ $\forall n \in \N$, $|u_{n+1} - x_0| \leq K|a-x_0|$.



==


