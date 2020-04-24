author=Luigi Manca

title=Théorème de Rolle 
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

** Parmi les énoncés suivants, lequel correspond au Théorème de Rolle ?
+ Soit $% f : [a,b] \rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. 
    On suppose $% f(a)=f(b) %$.
    Alors il existe $% c\in ]a,b[ %$ tel que $% f'(c)=0 %$.
- Soit $% f : [a,b] \rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$. 
On suppose $% f(a)=f(b) %$.
Alors il existe $% c\in ]a,b[ %$ tel que $% f(c)=0 %$.
- Soit $% f : [a,b] \rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. 
Alors il existe $% c\in ]a,b[ %$ tel que $% f'(c)=0 %$.
- Soit $% f : [a,b] \rightarrow \mathbb{R} %$ une fonction continue et dérivable sur $% ]a,b[ %$. 
On suppose $% f(a)=f(b) %$.
Alors il existe $% c\in ]a,b[ %$ tel que $% f'(c)=0 %$.

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



** Soient $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction satisfaisant les hypothèses du Théorème de Rolle sur $% [a,b] %$ et soit $% g:\mathbb{R} \to [a,b] %$ une fonction dérivable.
Cliquez sur les affirmations que vous pensez être correctes  :

+ $%  g\circ f %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
- $% f\circ g %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
- $% fg %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
+ $% h(x)=f(x)+ (g(x)-g(a))(g(x)-g(b)) %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 
+ $% h(x)=f(x)+ g(b-x)+g(x-a) %$ satisfait les hypothèses du Théorème de Rolle sur $% [a,b] %$ 




==


