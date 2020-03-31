
author=Benjamin Célariès

title=Théorème de Heine
tag=system|shell

extends=/model/AMC_TXT.pl
questions==

* Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème de Heine ?
+ $% \exists c \in [a;b] \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in [f(a);f(b)] \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in [f(a);f(b)] \text{ tel que } c = \sup\limits_{t \in [a;b]} f(t) %$
- $% \exists c \in \mathbb{R} \text{ tel que } f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \forall c \in [a;b], ~f(c) = \sup\limits_{t \in [a;b]} f(t) %$
- $% \forall t \in [a;b], ~f(c) = \sup\limits_{t \in [a;b]} f(t) %$


** Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Soit $%M = \sup\limits_{x \in [0;2\pi]} f(x)%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
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

** Soit $%f~:~ [0;2 \pi] \rightarrow \mathbb{R}%$ la fonction définie par $%f(x) = e^{\sin (x)}%$. Soit $%m = \inf\limits_{x \in [0;2\pi]} f(x)%$. Quelles sont les affirmations vraies ? Attention, il peut y avoir plusieurs bonnes réponses.
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

==
