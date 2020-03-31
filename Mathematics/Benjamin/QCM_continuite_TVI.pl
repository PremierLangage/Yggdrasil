author=Benjamin Célariès

title=Théorème des valeurs intermédiaires
tag=system|shell

extends=/model/AMC_TXT.pl
questions==


** Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
+ $% \exists c \in [0;2\pi] \text{ tel que } f(c) = 2%$
+ $% \exists c \in [0;2\pi] \text{ tel que } f(c) = \frac{3}{4}%$
- $% \exists c \in [0;2\pi] \text{ tel que } f(c) = 3%$
- $% \exists c \in [0;2\pi] \text{ tel que } f(c) = \frac{1}{10}%$

* Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème des valeurs intermédiaires ?
+ $% \forall y \in [f(a);f(b)], ~ \exists c \in [a;b] \text{ tel que } y=f(c) %$
- $% \exists y \in [f(a);f(b)], ~ \exists c \in [a;b] \text{ tel que } y=f(c) %$
- $% \exists y \in [f(a);f(b)] \text{ tel que}, ~ \forall c \in [a;b], ~ y=f(c) %$
- $% \forall y \in [f(a);f(b)], ~ \forall c \in [a;b], ~ y=f(c) %$
- $% \exists c \in [a;b] \text{ tel que}, ~ \forall y \in [f(a);f(b)], ~ y=f(c) %$

* Que peut-on dire de l'image d'un intervalle ouvert (non vide) par une fonction continue ?
+ C'est un intervalle dont on ne peut pas dire s'il est ouvert ou fermé.
- C'est un intervalle ouvert.
- C'est un intervalle fermé.
- On ne sait pas si c'est un intervalle.

* Que peut-on dire de l'image d'un intervalle fermé borné (non vide) par une fonction continue ?
- C'est un intervalle dont on ne peut pas dire s'il est ouvert ou fermé.
- C'est un intervalle ouvert.
+ C'est un intervalle fermé.
- On ne sait pas si c'est un intervalle.


* Soit $%f ~:~ [a;b] \rightarrow \mathbb{R} %$ une fonction continue. Quelle est l'affirmation exacte ?
+ $% [f(a);f(b)] \subset f([a;b])%$
- $% f([a;b]) \subset [f(a);f(b)]%$
- $% [f(a);f(b)] = f([a;b])%$
- On ne peut pas comparer $%[f(a);f(b)]%$ et $%f([a;b])%$.

* Soit $%f~:~[0;1] \rightarrow [0;1]%$ une fonction continue. Que peut-on dire sur les points fixes de $%f%$ ? Indication : on pourra étudier la fonction $% g ~:~ x \mapsto f(x) - x %$.
+ $%f%$ admet au moins un point fixe.
- $%f%$ admet au plus un point fixe.
- $%f%$ n'admet pas de point fixe.
- On ne peut rien dire sur les points fixes de $%f%$.


==
