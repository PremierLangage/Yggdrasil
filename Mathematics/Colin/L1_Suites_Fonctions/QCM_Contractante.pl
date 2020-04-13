author=Colin Petitjean

title=Fonctions contractantes
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

* On rappelle qu'une fonction est contractante si elle est K-Lipschitzienne pour un certain $%K \in ]0,1[%$. 
Une fonction $% f  : \mathbb{R} \rightarrow \mathbb{R}%$ est $%\textbf{non}%$ contractante si et seulement si : 
- $% \forall K >0, ~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > K|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| <|x-y| %$
- $% \exists K >0, ~ \forall x,y \in \mathbb{R}, ~ |f(x) - f(y)| \leq |x-y| %$
+ $% \forall K <1,~ \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > K |x-y| %$
- $% \exists x,y \in \mathbb{R} \text{ tel que } |f(x) - f(y)| > |x-y| %$


* Vrai ou faux ? La fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = -x+3 %$ est contractante.
- Vrai
+ Faux

* Vrai ou faux ? La fonction $% f :\mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = -\frac{5}{6} x + \frac{1}{6} %$ est contractante.
+ Vrai
- Faux

* On considère une fonction $% f : \mathbb{R} \rightarrow \mathbb{R} %$ telle que $%\lim\limits_{x \to +\infty} \dfrac{f(x)-f(0)}{x} = +\infty%$. 
Que peut-on dire de la fonction $%f%$ ?
- La fonction $%f%$ est contractante.
- La fonction $%f%$ n'est pas contractante mais elle est Lipschitzienne.
+ La fonction $%f%$ n'est pas Lipschitzienne.

* On considère la fonction $% f : \mathbb{R} \rightarrow \mathbb{R}%$ définie par $%f(x) = e^x %$. 
Cliquez sur l'affirmation que vous pensez être correcte :
- La fonction $%f%$ est contractante.
- La fonction $%f%$ n'est pas contractante mais elle est Lipschitzienne.
+ La fonction $%f%$ n'est pas Lipschitzienne.

* On considère la fonction $% f : [0,1] \rightarrow [0,1] %$ définie par $%f(x) = \sqrt{x} %$. 
En étudiant le terme $% \frac{f(x) - f(0)}{x-0} , %$
lorsque $%x \to 0^+%$, que pouvez vous en déduire sur $%f%$ ?
- La fonction $%f%$ est contractante.
- La fonction $%f%$ n'est pas contractante mais elle est Lipschitzienne.
+ La fonction $%f%$ n'est pas Lipschitzienne.





==




