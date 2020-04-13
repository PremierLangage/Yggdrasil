author=Colin Petitjean

title=Fonctions Lipschitziennes
tag=system|shell

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

* On rappelle qu'une fonction est contractante si elle est K-Lipschitzienne pour un certain $%K \in ]0,1[%$. 
Une fonction $% f  : \mathbb{R} \rightarrow \mathbb{R}%$ est non contractance si et seulement si : 
- $% \forall K >0, ~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > K|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| <|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| \leq |x-y| %$
+ $% \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| \geq |x-y| %$
- $% \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > |x-y| %$

* Vrai ou faux ? La fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = -x+3 %$ est contractante.
- Vrai
+ Faux

* Vrai ou faux ? La fonction $% f :\mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = -\frac{5}{6} x + \frac{1}{6} %$ est contractante.
+ Vrai
- Faux

* On considère une fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ telle que $%\lim\limits_{x \to +\infty} \dfrac{f(x)-f(0)}{x} = +\infty%$. Que peut-on dire de la fonction $%f%$ ?
- La fonction $%f%$ est contractante.
- La fonction $%f%$ n'est pas contractante mais elle est Lipschitzienne.
+ La fonction $%f%$ n'est pas Lipschitzienne.

* On considère la fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = e^x %$. 
Cliquez sur l'affirmation vous pensez être correcte :
- La fonction $%f%$ est contractante.
- La fonction $%f%$ n'est pas contractante mais elle est Lipschitzienne.
+ La fonction $%f%$ n'est pas Lipschitzienne.


** Soient $%f%$ et $%g%$ deux fonctions réelles définies sur $%\mathbb{R}%$. 
Cliquez sur les affirmations que vous pensez être correctes (plusieurs bonnes réponses) :
+ Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$, alors $%f%$ est Lipschitzienne tout intervalle du type $%[a,b]%$ ($%a<b%$).
- Si $%f%$ est Lipschitzienne sur tout intervalle du type $%[a,b]%$ ($%a<b%$), alors $%f%$ est Lipschitzienne sur $%\mathbb{R}%$.
+ Si $%f%$ est $%K%$-Lipschitzienne sur tout intervalle du type $%[a,b]%$ ($%a<b%$), alors $%f%$ est $%K%$-Lipschitzienne sur $%\mathbb{R}%$.
- Si $%f%$ et $%g%$ sont Lipschitziennes sur $%\mathbb{R}%$, alors nécessairement la fonction $%f\cdot g%$ l'est également. 
+ Si $%f%$ et $%g%$ sont Lipschitziennes sur $%\mathbb{R}%$, alors nécessairement la fonction $%f + g%$ l'est également. 
+ Si $%f%$ est Lipschitzienne sur $%\mathbb{R}%$ et $%\lambda \in \mathbb{R}%$, alors nécessairement la fonction $%\lambda f%$ l'est également.


* Vrai ou faux ? L'ensemble des fonctions Lipschitziennes de $%\mathbb R%$ dans $%\mathbb R%$ est un sous espace vectoriel de l'ensemble des fonctions.
+  Vrai
- Faux



==


