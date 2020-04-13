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


* Soit $%f%$ la fonction définie sur $%[0,1]%$ par $%f(x) = \frac{x}{2} + 1%$. 
On affirme que la fonction $%f%$ n'admet pas de point fixe sur $%[0,1]%$. 
Pourquoi ne peut-on pas lui appliquer le théorème du point fixe ?
+ Car $%f([0,1]) \not\subset [0,1]%$.
- Car $%f%$ n'est pas contractante. 
- Car $%f%$ n'est pas croissante. 
- Car $%f%$ n'est pas continue. 


* On considère la fonction définie sur $%[0,1]%$ par $%f(x) = 1-x^2%$. 
Vrai ou faux ? Pour tout $%x \in [0,1] %$, $% f(x) \in  [0,1] %$
+ Vrai
- Faux

* On admet que $%f(x) = 1-x^2%$ admet un unique point fixe $%x_0%$ sur $%[0,1]%$. Déterminez ce point fixe :
+ $%x_0 = \dfrac{-1+\sqrt{5}}{2}%$
- $%x_0 = \dfrac{-1-\sqrt{5}}{2}%$
- $%x_0 = 0%$
- $%x_0 = 1%$

* On considère toujours la fonction définie sur $%[0,1]%$ par $%f(x) = 1-x^2%$. 
Calculez et comparez $%|1-\frac{3}{4}|%$ et $%|f(1)-f(\frac{3}{4})|%$. Que peut-on en déduire sur $%f%$ ?
+ Elle n'est pas contractante.
- Elle n'est pas Lipschitzienne.
- Elle est 1-Lipschitzienne.
- Elle est contractante.

* Quel enseignement peut-on tirer de l'étude précédente de la fonction $%f(x) = 1-x^2%$ sur $%[0,1]%$ ?
- La réciproque du théorème du point fixe est vraie !
+ La réciproque du théorème du point fixe est fausse !


** Soit  $%f : [a,b] \to [a,b]%$ (où $% a<b %$) une fonction $%K%$-Lipschitzienne avec $%0<K<1%$. 
On note $%x_0%$ l'unique point fixe de $%f%$ donné par le théorème du point fixe.
On définit la suite $% (u_n) %$ par $%u_0 = a%$ et $% u_{n+1} = f(u_n) %$.
Que dire de cette suite (plusieurs bonnes réponses) ? 
+ Elle converge vers l'unique point fixe de $%f%$.
- Elle est croissante.
- Elle est décroissante.
- Elle n'admet pas de limite.
+ $%\forall n \in \mathbb N%$, $%|u_{n+1} - x_0| \leq K|a-x_0|%$.


* Soit $%f%$ la fonction définie sur $%[1,2]%$ par $%f(x) = \dfrac{x+2}{x+1} %$. 
On définit la suite $% (u_n)%$ par $%u_0 = \frac{3}{2}%$ et $% u_{n+1} = f(u_n) %$.
On admet que cette suite converge. Déterminez la limite de $% (u_n)_{n \in \mathbb N} %$.
+  $% \lim\limits_{n \to + \infty} u_n = \sqrt{2} %$
- $% \lim\limits_{n \to + \infty} u_n = \sqrt{5} %$
- $% \lim\limits_{n \to + \infty} u_n = 1 %$
- $% \lim\limits_{n \to + \infty} u_n = 2 %$
- $% \lim\limits_{n \to + \infty} u_n = \dfrac{1+\sqrt{5}}{2} %$



==


