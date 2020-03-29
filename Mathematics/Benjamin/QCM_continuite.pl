# Copyright 2020 Nicolas Borie <nicolas.borie@u-pem.fr>
author=Benjamin Célariès

title=Fonctions continues
tag=system|shell

extends=/model/AMC_TXT.pl
questions==





*Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème de Bolzano ?
+ $% \left( f(a)f(b) < 0 \right) \Rightarrow \left( \exists c \in ]a;b[ \text{ tel que } f(c) = 0 \right)%$
-$% \left( f(a)f(b) < 0 \right) \Rightarrow \left( \forall c \in ]a;b[, ~f(c) = 0 \right)%$
-$% \left( \forall c \in ]a;b[, ~f(c) = 0 \right) \Rightarrow  \left( f(a)f(b) < 0 \right)%$
-$% \left( \exists c \in ]a;b[, ~f(c) = 0 \right) \Rightarrow  \left( f(a)f(b) < 0 \right)%$

*Soit $% f ~:~\mathbb{R} \rightarrow \mathbb{R}%$ une fonction continue. On suppose que $%f(0) = f(2) = f(4) = \cdots = f(2020) = 42%$ et que $%f(1) = f(3) = f(5) = \cdots = f(2019) =-42%$. Que peut-on dire des zéros de $%f%$ ?
+ $%f%$ admet au moins 2020 zéros.
- $%f%$ admet au plus 2020 zéros.
- $%f%$ admet exactement 2020 zéros.
- On ne peut rien dire sur les zéros de $%f%$.

*Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème de Heine ?
+ $% \exists c \in [a;b] \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in [f(a);f(b)] \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in [f(a);f(b)] \text{ tel que } c = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in \mathbb{R} \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \forall c \in [a;b], ~f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \forall t \in [a;b], ~f(c) = \sup\limits_{t \in [a;b]} f(t) %$


**Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Soit $%M = \sup\limits_{x \in [0;2\pi]} f(x)%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
+ $%M=e%$
+ $% M \in f([0;2\pi]) %$
+ $% M = f \left( \frac{\pi}{2} \right) %$
- $% M=0  %$
- $% M=1  %$
- $% M=\frac{1}{e}  %$
- $%   M \notin f([0;2\pi]) %$
- $% M = f(0)  %$
- $%  M=f(\pi) %$
- $%   M = f \left( \frac{3\pi}{2} \right) %$
- $%  M=f(2 \pi) %$

**Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Soit $%m = \inf\limits_{x \in [0;2\pi]} f(x)%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
- $%m=e%$
+ $% m \in f([0;2\pi]) %$
- $% m = f \left( \frac{\pi}{2} \right) %$
- $% m=0  %$
- $% m=1  %$
+ $% m=\frac{1}{e}  %$
- $%   m \notin f([0;2\pi]) %$
- $% m = f(0)  %$
- $%  m=f(\pi) %$
+ $%  m = f \left( \frac{3\pi}{2} \right) %$
- $% m=f(2 \pi) %$

**Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
+ $% \exists c \in [0;2\pi] \text{ tel que } f(c) = 2%$
+ $% \exists c \in [0;2\pi] \text{ tel que } f(c) = \frac{3}{4}%$
- $% \exists c \in [0;2\pi] \text{ tel que } f(c) = 3%$
- $% \exists c \in [0;2\pi] \text{ tel que } f(c) = \frac{1}{10}%$

*Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème des valeurs intermédiaires ?
+ $% \forall y \in [f(a);f(b)], ~ \exists c \in [a;b] \text{ tel que } y=f(c) %$
- $% \exists y \in [f(a);f(b)], ~ \exists c \in [a;b] \text{ tel que } y=f(c) %$
- $% \exists y \in [f(a);f(b)] \text{ tel que}, ~ \forall c \in [a;b], ~ y=f(c) %$
- $% \forall y \in [f(a);f(b)], ~ \forall c \in [a;b], ~ y=f(c) %$
- $% \exists c \in [a;b] \text{ tel que}, ~ \forall y \in [f(a);f(b)], ~ y=f(c) %$

*Que peut-on dire de l'image d'un intervalle ouvert (non vide) par une fonction continue ?
+ C'est un intervalle dont on ne peut pas dire s'il est ouvert ou fermé.
- C'est un intervalle ouvert.
- C'est un intervalle fermé.
- On ne sait pas si c'est un intervalle.

*Que peut-on dire de l'image d'un intervalle fermé borné (non vide) par une fonction continue ?
- C'est un intervalle dont on ne peut pas dire s'il est ouvert ou fermé.
- C'est un intervalle ouvert.
+ C'est un intervalle fermé.
- On ne sait pas si c'est un intervalle.


*Soit $%f ~:~ [a;b] \rightarrow \mathbb{R} %$ une fonction continue. Quelle est l'affirmation exacte ?
+ $% [f(a);f(b)] \subset f([a;b])%$
- $% f([a;b]) \subset [f(a);f(b)]%$
- $% [f(a);f(b)] = f([a;b])%$
- On ne peut pas comparer $%[f(a);f(b)]%$ et $%f([a;b])%$.

*Soit $%f~:~[0;1] \rightarrow [0;1]%$ une fonction continue. Que peut-on dire sur les points fixes de $%f%$ ? Indication : on pourra étudier la fonction $% g ~:~ x \mapsto f(x) - x %$.
+ $%f%$ admet au moins un point fixe.
- $%f%$ admet au plus un point fixe.
- $%f%$ n'admet pas de point fixe.
- On ne peut rien dire sur les points fixes de $%f%$.


==






