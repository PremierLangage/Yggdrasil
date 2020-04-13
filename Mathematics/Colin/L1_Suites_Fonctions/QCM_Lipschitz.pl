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
Une fonction $% f  : \mathbb{R} \rightarrow \mathbb{R}%$ est $%\textbf{non}%$ contractante si et seulement si : 
- $% \forall K >0, ~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > K|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| <|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| \leq |x-y| %$
+ $% \forall K <1,~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > K |x-y| %$
- $% \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > |x-y| %$



==



