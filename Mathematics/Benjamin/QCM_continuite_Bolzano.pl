# Copyright 2020 Nicolas Borie <nicolas.borie@u-pem.fr>
author=Benjamin Célariès

title=Théorème de Bolzano
tag=system|shell

extends=/model/AMC_TXT.pl
questions==





* Soit $% f ~:~[a;b] \rightarrow \mathbb{R}%$ une fonction continue. Quel énoncé mathématique correspond à la conclusion du théorème de Bolzano ?
+ $% \left( f(a)f(b) < 0 \right) \Rightarrow \left( \exists c \in ]a;b[ \text{ tel que } f(c) = 0 \right)%$
-$% \left( f(a)f(b) < 0 \right) \Rightarrow \left( \forall c \in ]a;b[, ~f(c) = 0 \right)%$
-$% \left( \forall c \in ]a;b[, ~f(c) = 0 \right) \Rightarrow  \left( f(a)f(b) < 0 \right)%$
-$% \left( \exists c \in ]a;b[, ~f(c) = 0 \right) \Rightarrow  \left( f(a)f(b) < 0 \right)%$

* Soit $% f ~:~\mathbb{R} \rightarrow \mathbb{R}%$ une fonction continue. On suppose que $%f(0) = f(2) = f(4) = \cdots = f(2020) = 42%$ et que $%f(1) = f(3) = f(5) = \cdots = f(2019) =-42%$. Que peut-on dire des zéros de $%f%$ ?
+ $%f%$ admet au moins 2020 zéros.
- $%f%$ admet au plus 2020 zéros.
- $%f%$ admet exactement 2020 zéros.
- On ne peut rien dire sur les zéros de $%f%$.





==








