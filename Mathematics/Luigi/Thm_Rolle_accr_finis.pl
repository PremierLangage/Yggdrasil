author=Luigi Manca

title=Théorème de Rolle / Théorème des ccroissements finis
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

** Soit $% f : \mathbb{R} \rightarrow \mathbb{R} %$ une fonction dérivable et $% a<b %$.
Peut-on affirmer que : 
+ $% f %$ admet au moins un minimum et au moins un maximum sur $% [a,b] %$
- Il existe $% c\in [a,b] %$ où $% f %$  admet un maximum locale et où $% f'(c) = 0%$
- Si $% c \in [a,b] %$ et $% f'(c)=0 %$ alors $% f %$ admet un maximum ou minimum locale en $% c %$
- Si $% c \in ]a,b[ %$ et $% f'(c)=0 %$ alors $% f %$ admet un maximum ou minimum locale en $% c %$
+ Si  $% c \in ]a,b[ %$ et $% c %$ est un point de  maximum ou minimum locale pour $% f %$ alors  $% f'(c)=0 %$ 
+ Il existe $% c \in ]a,b[ %$ tel que $% f'(c) (b-a) = f(b)-f(a) %$ 



** Parmi les fonctions suivantes, indiquer celles qui satisfont les hypothèses du Théorème de Rolle sur l'intervalle $% [0,1 ] %$,: 
- $% f(x)=x %$
+ $% f(x) = (1-x)x %$
+ $% f(x)=\sqrt{(1-x)x} %$
- $% f(x)=|2x-1| %$
+ $% f(x)=x^2 %$
+ $% f(x)= \sin(2020\pi x) %$
+ $% f(x)=e^\pi %$
- $% f(x)=E(x) %$  ( Ici, $% E(x) %$ est la partie entière de $% x %$ )

** Parmi les fonctions suivantes, indiquer celles qui satisfont les hypothèses du Théorème des accroissements finis sur l'intervalle $% [0,1 ] %$,: 
+ $% f(x)=x %$
+ $% f(x) = (1-x)x %$
+ $% f(x)=\sqrt{(1-x)x} %$
- $% f(x)=|2x-1| %$
+ $% f(x)=x^2 %$
+ $% f(x)= \sin(2020\pi x) %$
+ $% f(x)=e^\pi %$
- $% f(x)=E(x) %$  ( Ici, $% E(x) %$ est la partie entière de $% x %$ )

** Parmi les fonctions suivantes, indiquer celles qui satisfont les hypothèses de l'inégalité des accroissements finis sur l'intervalle $% [0,1 ] %$,: 
+ $% f(x)=x %$
+ $% f(x) = (1-x)x %$
- $% f(x)=\sqrt{(1-x)x} %$
- $% f(x)=|2x-1| %$
+ $% f(x)=x^2 %$
+ $% f(x)= \sin(2020\pi x) %$
+ $% f(x)=e^\pi %$
- $% f(x)=E(x) %$  ( Ici, $% E(x) %$ est la partie entière de $% x %$ )

* Vrai ou faux ? 
Si une fonction $% f : [a,b] \rightarrow \mathbb{R}%$ satisfait les hypothèses du Théorème des accroissements finis alors elle est Lipschitzienne.
- Vrai
+ Faux

* Vrai ou faux ? 
Si une fonction $% f : [a,b] \rightarrow \mathbb{R}%$ satisfait les hypothèses de l'inégalité des accroissements finis alors elle est Lipschitzienne.
+ Vrai
- Faux

* Vrai ou faux ? 
Si une fonction $% f : [a,b] \rightarrow \mathbb{R}%$ satisfait les hypothèses du Théorème des accroissements et elle est Lipschitzienne alors elle satisfait les hypothèse de l'inégalité des accroissements finis.
+ Vrai
- Faux

* Vrai ou faux ?
Si $% f:]a,b[\to \mathbb{R} %$ est dérivable et strictement croissante, alors $%\forall x\in ]a,b[,\, f'(x) > 0 %$.
- Vrai
+ Faux

* Vrai ou faux ?
Soit $% f:[a,b] \rightarrow [a,b] %$ continue, dérivable sur $% ]a,b[ %$ et $% f(a)=a%$, $% f(b)=b %$. 
Alors, il existe $% c\in ]a,b[ %$ tel que $% f'(c)\geq 1 %$.
+ Vrai
- Faux

** Soient $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction satisfaisant les hypothèses du Théorème de Rolle sur $% [a,b] %$ et soit $% g:\mathbb{R} \to [a,b] %$ une fonction dérivable.
On peut affirmer que (plusieurs bonnes réponses) :

+ $% g\circ f %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
- $% f\circ g %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
- $% f\circ g %$ satisfait les hypothèses du Théorème des accroissements finis sur $% [a,b] %$ 
+ $% g\circ f %$ satisfait les hypothèses du Théorème des accroissements finis sur $% [a,b] %$ 




==




