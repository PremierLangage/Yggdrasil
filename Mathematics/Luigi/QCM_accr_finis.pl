author=Luigi Manca

title= Théorème des accroissements finis
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

** Parmi les énoncés suivants, lequel correspond au Théorème des accroissements finis ?
+ Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Alors, il existe $% c \in ]a,b[%$ tel que $% f(b)-f(a) = f’(c)(b-a) %$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% ]a,b[ %$, dérivable sur $% [a,b] %$. Alors, il existe $% c \in ]a,b[%$ tel que $% f(b)-f(a) = f’(c)(b-a) %$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction définie sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Alors, il existe $% c \in ]a,b[%$ tel que $% f(b)-f(a) = f’(c)(b-a) %$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Alors, il existe $% c \in ]a,b[%$ tel que $% f(b)-f(a) = f’(c) %$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Alors, pour tout  $% c \in ]a,b[%$ on a  $% f(b)-f(a) = f’(c)(b-a) %$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Alors, pour tout  $% c \in ]a,b[%$ on a  $% f'(b)-f'(a) = f(c)(b-a) %$.


** Parmi les fonctions suivantes, indiquer celles qui satisfont les hypothèses du Théorème des accroissements finis sur l'intervalle $% [0,1 ] %$ : 
+ $% f(x)=x %$
+ $% f(x) = (1-x)x %$
+ $% f(x)=\sqrt{(1-x)x} %$
- $% f(x)=|2x-1| %$
+ $% f(x)=x^2 %$
+ $% f(x)= \sin(2020\pi x) %$
+ $% f(x)=e^\pi %$
- $% f(x)=E(x) %$  ( Ici, $% E(x) %$ est la partie entière de $% x %$ )

** Parmi les énoncés suivants, lequel correspond au Théorème de l'Inégalité des accroissements finis ?
+ Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Soit $% M\geq0 %$ tel que pour tout $% x\in ]a,b[ %$, $% f'(x)\leq M %$. Alors, $% |f(b)-f(a)|\leq M|b-a|%$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$.  Alors, il existe $% M\geq 0 %$ tel que $% |f(b)-f(a)|\leq M|b-a|%$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$. Alors, $% |f(b)-f(a)|\leq M|b-a|%$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction définie sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Soit $% M\geq0 %$ tel que pour tout $% x\in ]a,b[ %$, $% f'(x)\leq M %$. Alors, $% |f(b)-f(a)|\leq M|b-a|%$.
- Soit $% f:[a,b]\rightarrow \mathbb{R} %$ une fonction continue sur $% [a,b] %$, dérivable sur $% ]a,b[ %$. Soit $% M\geq0 %$ tel que pour tout $% x\in ]a,b[ %$, $% f'(x)\leq M %$. Alors, $% |f(b)-f(a)|\geq M|b-a|%$.


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
Si une fonction $% f : [a,b] \rightarrow \mathbb{R}%$ satisfait les hypothèses du Théorème des accroissements et si elle est Lipschitzienne alors elle satisfait les hypothèse de l'inégalité des accroissements finis.
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
On peut affirmer que :

- $% f\circ g %$ satisfait les hypothèses du Théorème des accroissements finis sur $% [a,b] %$ 
+ $% g\circ f %$ satisfait les hypothèses du Théorème des accroissements finis sur $% [a,b] %$ 




==







