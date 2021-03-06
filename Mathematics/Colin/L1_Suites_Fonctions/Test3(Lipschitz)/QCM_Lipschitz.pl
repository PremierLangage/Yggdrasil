author=Colin Petitjean

title=Fonctions Lipschitziennes
tag=Lipschitz|function|math|continuity

extends=/model/AMC_TXT.pl
questions==


* Rappeler la définition d'une fonction $% f :\mathbb{R} \rightarrow \mathbb{R}%$ Lipschitzienne : 
- $% \forall K >0, ~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| \leq K|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| \leq |x-y| %$
+ $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| \leq K|x-y| %$
- $% \forall \varepsilon >0, ~ \exists K >0, \forall x,y \in \mathbb{R}, ~ \Big[|x-y| \leq K \Big] \implies |f(x) - f(y)| \leq \varepsilon %$

* Vrai ou faux ? 
Si une fonction $% f :\mathbb{R} \rightarrow \mathbb{R}%$ est 2-Lipschitzienne alors elle 1-Lipschitzienne également. 
- Vrai
+ Faux

* Vrai ou faux ? 
Si une fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ est 1-Lipschitzienne alors elle 2-Lipschitzienne également.
+ Vrai
- Faux

** On considère la fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $% f(x) = -3x +2 %$. 
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
- La fonction $%f%$ n'est pas Lipschitzienne.
+ La fonction $%f%$ est Lipschitzienne.
- La fonction $%f%$ est 1-Lipschitzienne.
- La fonction $%f%$ est 2-Lipschitzienne.
+ La fonction $%f%$ est 3-Lipschitzienne.
+ La fonction $%f%$ est 1000-Lipschitzienne.

** On considère la fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $% f(x) = 4x +1000  %$. 
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
- La fonction $%f%$ n'est pas Lipschitzienne.
+ La fonction $%f%$ est Lipschitzienne.
- La fonction $%f%$ est 1-Lipschitzienne.
+ La fonction $%f%$ est 4-Lipschitzienne.
+ La fonction $%f%$ est 1000-Lipschitzienne.

** Soit la fonction définie sur $%\mathbb{R}%$ par $%f(x) = |x|%$. 
Pour étudier si la fonction $%f%$ est Lipschitzienne, on pourra utiliser la deuxième inégalité triangulaire (dite parfois renversée).
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
+ La fonction $%f%$ n'est pas dérivable en 0.
+ La fonction $%f%$ est Lipschitzienne.
+ La fonction $%f%$ n'est pas bornée sur $%\mathbb{R}%$ .
- La fonction $%f%$ est dérivable sur $%\mathbb{R}%$  
- La fonction $%f%$ n'est pas Lipschitzienne. 
- La fonction $%f%$ est bornée sur $%\mathbb{R}%$ .

** Soit la fonction définie sur $%\mathbb R%$ par $%f(x) = x^2%$. 
Pour étudier si la fonction $%f%$ est Lipschitzienne, on pourra étudier le terme $%\frac{f(x) - f(0)}{x}%$ lorsque $%x%$ tend vers $+\infty$.
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
- La fonction $%f%$ est Lipschitzienne.
- La fonction $%f%$ est monotone sur $%\mathbb{R}%$ .
+ La fonction $%f%$ n'est pas Lipschitzienne. 
+ La fonction n'est pas monotone sur $%\mathbb{R}%$ .

* Soit une fonction $% f :\mathbb{R} \rightarrow \mathbb{R}%$.
Cliquez sur l'affirmation que vous pensez être correcte :
+ Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$ alors $%f%$ est continue sur $%\mathbb{R}%$.
- Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$ alors $%f%$ est dérivable sur $%\mathbb{R}%$.
- Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$ alors $%f%$ est bornée sur $%\mathbb{R}%$.
- Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$ alors $%f%$ est monotone sur $%\mathbb{R}%$.



** Soient $%f%$ et $%g%$ deux fonctions réelles définies sur $%\mathbb{R}%$. 
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
+ Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$, alors $%f%$ est Lipschitzienne tout intervalle du type $%[a,b]%$ ($%a<b%$).
- Si $%f%$ est Lipschitzienne sur tout intervalle du type $%[a,b]%$ ($%a<b%$), alors $%f%$ est Lipschitzienne sur $%\mathbb{R}%$.
+ Si il existe $%K>0%$ tel que $%f%$ est $%K%$-Lipschitzienne sur tout intervalle du type $%[a,b]%$ ($%a<b%$), alors $%f%$ est $%K%$-Lipschitzienne sur $%\mathbb{R}%$.


* Vrai ou faux ? L'ensemble des fonctions Lipschitziennes de $%\mathbb R%$ dans $%\mathbb R%$ est un sous espace vectoriel de l'ensemble des fonctions.
+  Vrai
- Faux



==







