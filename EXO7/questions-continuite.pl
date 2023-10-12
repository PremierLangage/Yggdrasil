extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Quels arguments sont valides pour justifier que la fonction $%x \mapsto \sin(x)%$ n'est pas une fonction croissante sur $%\mathbb{R}%$ ?

==
good==
$%\sin(\frac{3\pi}{4}) > \sin(\pi)%$ et pourtant $%\frac{3\pi}{4} < \pi%$.
==
bad==
$%\sin(\pi) = \sin(0)%$ et pourtant $%\pi \neq 0%$.
$%\sin(\frac\pi2) > \sin(0)%$ et pourtant $%0 < \frac\pi2%$.
On a $%|\sin x| \leqslantslant |x|%$ pour tout $%x\in\mathbb{R}%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soient $%f,g%$ deux fonctions définies sur $%\mathbb{R}%$. Quelles sont les assertions vraies ?

==
good==
$%f-2g%$ est une fonction définie sur $%\mathbb{R}%$.
$%f^2 \times g%$ est une fonction définie sur $%\mathbb{R}%$.
==
bad==
$%\frac{f}{g^2}%$ est une fonction définie sur $%\mathbb{R}%$.
$%\sqrt{f+g}%$ est une fonction définie sur $%\mathbb{R}%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Quelles sont les assertions vraies concernant le domaine de définition des fonctions suivantes ? (Rappel : le domaine de définition de $%f%$ est le plus grand ensemble $%D_f \subset \mathbb{R}%$ sur lequel $%f%$ est définie.)

==
good==
Le domaine de définition de $%\exp(\frac{1}{x^2+1})%$ est $%\mathbb{R}%$.
==
bad==
Le domaine de définition de $%\sqrt{x^2-1}%$ est $%[1,+\infty[%$.
Le domaine de définition de $%\frac{1}{\sqrt{(x-1)(x-3)}}%$ est $%]1,3[%$.
Le domaine de définition de $%\ln(x^3-8)%$ est $%[2,+\infty[%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Quels arguments sont valables pour montrer que $%f : \mathbb{R} \to \mathbb{R}%$ est décroissante ?

==
good==
On a $%x \leqslantslant y%$ qui implique $%f(x) \geqslantslant f(y)%$.
On a $%x \geqslantslant y%$ qui implique $%f(x) \leqslantslant f(y)%$.
==
bad==
On a $%x \leqslantslant y%$ qui implique $%f(x) \leqslantslant f(y)%$.
On a $%x \geqslantslant y%$ qui implique $%f(x) \geqslantslant f(y)%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : \mathbb{R} \to \mathbb{R}%$. Quelles sont les assertions vraies ?

==
good==
$%\exists  M > 0 \quad \forall x \in \mathbb{R} \quad f(x) \leqslantslant M%$  implique $%f%$ majorée.
==
bad==
$%\forall  M > 0 \quad \exists x \in \mathbb{R} \quad f(x) \leqslantslant M%$  implique $%f%$ majorée.
$%\forall  x \in \mathbb{R} \quad \exists  M > 0 \quad f(x) \geqslantslant M%$  implique $%f%$ majorée.
$%\exists  M > 0 \quad \exists x \in \mathbb{R} \quad f(x) \geqslantslant M%$  implique $%f%$ majorée.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Quelles sont les assertions vraies ?

==
good==
Une fonction périodique et croissante est constante.
Si $%f : \mathbb{R} \to ]0,+\infty[%$ est croissante, alors $%1/f%$ est décroissante.
==
bad==
La fonction $%x \mapsto \frac{1}{x}%$ est décroissante car sa dérivée $%x \mapsto -\frac{1}{x^2}%$ est partout négative.
Si $%f%$ et $%g%$ sont croissantes, alors $%f-g%$ est croissante.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%f(x) = \ln(x-1)%$ et $%g(x) = \sqrt{x+1}%$. 
Quelles sont les assertions vraies concernant les domaines de définition ? (Rappel : le domaine de définition de $%f%$ est le plus grand ensemble $%D_f \subset \mathbb{R}%$ sur lequel $%f%$ est définie.)

==
good==
$%D_f \cup D_g = [-1,+\infty[%$.
Pour la fonction $%f \times g%$, $%D_{f\times g} = ]1,+\infty[%$.
==
bad==
Pour la composition $%f \circ g%$, $%D_{f\circ g} = [-1,+\infty[%$.
Pour la composition $%g \circ f%$, $%D_{g\circ f} = ]1,+\infty[%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : \mathbb{R} \to \mathbb{R}%$ une fonction à valeurs strictement positives. Quels arguments sont valables pour montrer que $%f%$ est croissante ?

==
good==
Pour tout $%x\in\mathbb{R}%$, pour tout $%h>0%$, on a $%\frac{f(x+h)}{f(x)} \geqslantslant 1%$.
==
bad==
Pour tout $%x\in\mathbb{R}%$, on a $%f(x+1) \geqslantslant f(x)%$.
Pour tout $%x\in\mathbb{R}%$, on a $%\frac{f(x+1)}{f(x)} \geqslantslant 1%$.
Pour tout $%x\in\mathbb{R}%$, il existe $%h>0%$ tel que $%f(x+h) \geqslantslant f(x)%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soient $%f,g : \mathbb{R} \to \mathbb{R}%$. Quelles sont les assertions vraies ?

==
good==
Si $%f%$ bornée et $%g%$ majorée alors $%f-g%$ est minorée.
==
bad==
Si $%f%$ est bornée et $%g%$ majorée alors $%f-g%$ est bornée.
Si $%f%$ et $%g%$ sont minorées, alors $%f \times g%$ est minorée.
Si $%f%$ et $%g%$ sont minorées, alors $%|f \times g|%$ est bornée.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soient $%f : ]-\infty,0[ \to ]0,1[%$ et $%g : ]-2,2[ \to ]0,+\infty[%$.
Quelles sont les assertions vraies ?

==
good==
Le domaine de définition de $%x \mapsto \frac{g(x+1)}{f(x)}%$ est $%]-3,0[%$.
Le domaine de définition de $%x \mapsto \frac{f(x) \times g(x)}{f(x)+g(x)}%$ est $%]-2,0[%$.
==
bad==
Le domaine de définition de $%x \mapsto g\big(f(2x)\big)%$ est $%]-1,1[%$.
Le domaine de définition de $%x \mapsto g\big( \ln (f(x)) \big)%$ est $%]0,+\infty[%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Quelles fonctions sont continues en $%x=0%$ ?

==
good==
$%x \mapsto |x|%$ (valeur absolue).
$%x \mapsto \sqrt{x}%$ (racine carrée).
==
bad==
$%x \mapsto E(x)%$ (partie entière).
$%x \mapsto \frac 1x%$ (inverse).
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Parmi les fonctions suivantes, lesquelles sont continues sur $%\mathbb{R}%$ ?

==
good==
$%x \mapsto \cos(x)-\sin(x)%$
$%x \mapsto \frac{1}{\exp(x)}%$
$%x \mapsto \ln(\exp(3x))%$
==
bad==
$%x \tan(x)%$
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Quelles sont les propriétés vraies ?

==
good==
La somme de deux fonctions continues est continue.
Le produit de deux fonctions continues est continue.
L'inverse d'une fonction continue ne s'annulant pas est continue.
==
bad==
Le quotient de deux fonctions continues est continue.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Parmi les propriétés suivantes, quelles sont celles qui implique que $%f%$ est continue en $%x_ 0%$ ?

==
good==
$%\lim_{x\to x_0} f(x) = f(x_0)%$
$%\forall arepsilon >0 \quad \exists \delta > 0 \qquad
|x-x_0| \leqslantslant \delta \implies |f(x)-f(x_0)| \leqslantslant arepsilon%$
$%\big| f(x) - f(x_0) \big| \to 0%$ lorsque $%x \to x_0%$
==
bad==
$%\exists \delta > 0 \quad \forall arepsilon >0 \qquad
|x-x_0| < \delta \implies |f(x)-f(x_0)| < arepsilon%$
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Parmi les fonctions suivantes, lesquelles sont continues sur $%\mathbb{R}%$ ?

==
good==
$%x \mapsto P(x)%$, où $%P%$ est un polynôme.
$%x \mapsto |f(x)|%$, où $%f%$ est une fonction continue.
$%x \mapsto \frac{1}{f(x)}%$, où $%f%$ est une fonction continue ne s'annulant pas.
==
bad==
La fonction $%f%$ définie par $%f(x) = 0%$, si $%x\in \mathbb{Q}%$ et par $%f(x)=1%$ sinon.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
En posant $%f(0)=0%$, quelles fonctions deviennent continues sur $%\mathbb{R}%$ ?

==
good==
$%f(x) = x \ln( |x|)%$
==
bad==
$%f(x) = \frac 1x%$
$%f(x) = \frac{\sin(x)}{x}%$
$%f(x) = e^{1/x}%$
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Parmi les propriétés suivantes, quelles sont celles qui impliquent que $%f%$ est continue en $%x_ 0%$ ?

==
good==
$%f(x)^3 \to f(x_0)^3%$ (lorsque $%x \to x_0%$)
$%\exp(f(x)) \to \exp(f(x_0))%$ (lorsque $%x \to x_0%$)
==
bad==
$%f(x)^2 \to f(x_0)^2%$ (lorsque $%x \to x_0%$)
$%E(f(x)) \to E(f(x_0))%$ (lorsque $%x \to x_0%$)
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Soit $%f : \mathbb{R} \to \mathbb{R}%$ une fonction et $%(u_n)_{n\in\mathbb{N}}%$ une suite. Quelles sont les assertions vraies ?

==
good==
Si $%u_n \to \ell%$ et $%f%$ continue en $%\ell%$, alors $%f(u_n)%$ admet une limite.
Si $%u_n \to \ell%$ et $%f(u_n)%$ n'a pas de limite, alors $%f%$ n'est pas continue en $%\ell%$.
Si pour toute suite qui vérifie $%u_n \to \ell%$, on a $%f(u_n) \to f(\ell)%$, alors $%f%$ est continue en $%\ell%$.
==
bad==
Si $%f(u_n) \to f(\ell)%$ et $%f%$ est continue en $%\ell%$, alors $%u_n \to \ell%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Quelles assertions peut-on déduire du théorème des valeurs intermédiaires ?

==
good==
$%\sin(x) - x^2 + 1%$ s'annule sur $%[0,\pi]%$.
$%x^5-37%$ s'annule sur $%[2,3]%$.
$%\ln(x+1)-x+1%$ s'annule sur $%[0,+\infty[%$.
==
bad==
$%e^x+e^{-x}%$ s'annule sur $%[-1,1]%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%f(x)=x^2-7%$. On applique la méthode de dichotomie sur l'intervalle $%[2 ; 3]%$. 
On calcule $%f(2,125)=-1,9375%$ ; $%f(2,5) = -0,75%$ ; $%f(2,625) = -0,109375%$ ; $%f(2,75) = 0,5625%$. Quelles sont les assertions vraies ?

==
good==
$%f%$ s'annule sur $%[2,5 ; 3]%$.
$%2,6 \leqslantslant \sqrt{7} \leqslantslant 2,8%$
==
bad==
$%f%$ s'annule sur $%[2 ; 2,5]%$ et sur $%[2,5 ; 3]%$.
$%f%$ s'annule sur $%[2,75 ; 3]%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : [a,b] \to \mathbb{R}%$ une fonction continue (avec $%a < b%$). Quelles assertions sont une conséquence du théorème des valeurs intermédiaires ?

==
good==
Si $%f(a) < k < f(b)%$ alors $%f(x)-k%$ s'annule sur $%[a,b]%$.
==
bad==
Si $%f(a) \cdot f(b) > 0%$ alors $%f%$ s'annule sur $%[a,b]%$.
Pour $%I \subset \mathbb{R}%$, si $%f(I)%$ est un intervalle alors $%I%$ est un intervalle.
Si $%c \in ]a,b[%$ alors $%f(c) \in ]f(a),f(b)[%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : [0,1] \to \mathbb{R}%$ une fonction continue avec $%f(0)<0%$ et $%f(1)>0%$.
Par dichotomie on construit deux suites $%(a_n)%$ et $%(b_n)%$, avec $%a_0 = 0%$ et $%b_0 = 1%$. Quelles sont les assertions vraies ?

==
good==
$%f%$ s'annule sur $%[a_n,b_n]%$ (quel que soit $%n\geqslantslant0%$).
==
bad==
Si $%f(\frac12)>0%$ alors $%a_1 = \frac12%$ et $%b_1 = \frac12%$.
$%(a_n)%$ et $%(b_n)%$ sont des suites croissantes.
$%a_n \to 0%$ ou $%b_n \to 0%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : [a,b] \to \mathbb{R}%$ une fonction continue (avec $%a < b%$). Quelles assertions sont vraies ?

==
good==
Si $%f(a) \cdot f(b) < 0%$ et $%f%$ strictement décroissante, alors $%f%$ s'annule une unique fois sur $%[a,b]%$.
==
bad==
Si $%f(a) \cdot f(b) < 0%$ et $%f%$ croissante alors $%f%$ s'annule une unique fois sur $%[a,b]%$.
Si $%f(a) \cdot f(b) < 0%$ et $%f%$ n'est pas strictement monotone alors $%f%$ s'annule au moins deux fois sur $%[a,b]%$.
Si $%f(a) \cdot f(b) < 0%$ alors $%f%$ s'annule un nombre fini de fois sur $%[a,b]%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Soit $%f : [0,1] \to \mathbb{R}%$ une fonction continue avec $%f(0)>0%$ et $%f(1)<0%$.
Par dichotomie on construit deux suites $%(a_n)%$ et $%(b_n)%$, avec $%a_0 = 0%$ et $%b_0 = 1%$. Quelles sont les assertions vraies ?

==
good==
$%(a_n)%$ et $%(b_n)%$ sont des suites adjacentes.
Si $%f(a_n)<0%$ et $%f\big(\frac{a_n+b_n}{2}\big) >0%$ alors $%a_{n+1} =\frac{a_n+b_n}{2}%$ et $%b_{n+1}=b_n%$.
Pour $%n=10%$, $%a_{10}%$ approche une solution de $%(f=0)%$ à moins de $%\frac{1}{1000}%$.
==
bad==
$%(f=0)%$ admet une unique solution sur $%[a_n,b_n]%$.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%1
text==
Soit $%f : [a,b] \to \mathbb{R}%$ continue. Quelles sont les assertions vraies ?

==
good==
$%f%$ est bornée sur $%]a,b[%$.
==
bad==
$%f%$ admet un maximum sur $%]a,b[%$.
$%f%$ admet un maximum en $%a%$ ou en $%b%$.
$%f%$ admet un maximum ou un minimum sur $%[a,b]%$ mais pas les deux.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%f : \mathbb{R} \to \mathbb{R}%$ une fonction continue telle que : elle est strictement croissante sur $%]-\infty,0]%$ ; strictement décroissante sur $%[0,1]%$ ; strictement croissante sur $%[1,+\infty[%$. En plus $%\lim_{x\to-\infty} f = - \infty%$, $%f(0)=2%$, $%f(1) = 1%$ et $%\lim_{x\to+\infty} f = 3%$. Quelles sont les assertions vraies ?

==
good==
La restriction $%f_| : ]-\infty,0] \to ]-\infty,2]%$ est bijective.
La restriction $%f_| : [0,1] \to [1,2]%$ est bijective.
==
bad==
La restriction $%f_| : [1,+\infty[ \to [1,+\infty[%$ est bijective.
La restriction $%f_| : ]0,+\infty] \to [1,3[%$ est bijective.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%f(x) = x \sin(\pi x) - \ln(x) - 1%$ définie sur $%]0,1]%$.
Quelles sont les assertions vraies ?

==
good==
$%f%$ est minorée.
Il existe $%c \in ]0,1]%$ tel que $%f(c)=0%$.
==
bad==
$%f%$ est bornée et atteint ses bornes.
$%f%$ est majorée.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%f : [a,b] \to [c,d]%$ continue avec $%a < b%$, $%c < d%$, $%f(a)=c%$, $%f(b)=d%$. Quelles propriétés impliquent $%f%$ bijective ?

==
good==
$%f%$ injective.
$%f%$ strictement croissante.
==
bad==
$%f%$ surjective.
$%f%$ croissante.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%2
text==
Soit $%I%$ un intervalle de $%\mathbb{R}%$ et soit $%f : I \to \mathbb{R}%$ une fonction continue. Soit $%J=f(I)%$. Quelles sont les assertions vraies ?

==
good==
$%J%$ est un intervalle.
Si $%I%$ est fermé borné, alors $%J%$ est fermé borné.
==
bad==
Si $%I%$ est majoré, alors $%J%$ est majoré.
Si $%I%$ est borné, alors $%J%$ est borné.
==

extends= /ComputerScience/python/template/qcm_template.pl
author=Arnaud Bodin, Abdellah Hanani, Mohamed Mzari
title=Continuité | 123
nb%4
nbtrues%3
text==
Soit $%f : I \to J%$ une fonction continue, où $%I%$ et $%J%$ sont des intervalles de $%\mathbb{R}%$. Quelles sont les assertions vraies ?

==
good==
Si $%f%$ surjective et strictement croissante, alors $%f%$ est bijective.
Si $%f%$ bijective, alors sa bijection réciproque $%f^{-1}%$ est continue.
Si $%f%$ bijective et $%J%$ est un intervalle fermé et borné, alors $%I%$ est un intervalle fermé et borné.
==
bad==
Si $%f%$ bijective et $%I=\mathbb{R}%$, alors $%J%$ n'est pas un intervalle borné.
==

