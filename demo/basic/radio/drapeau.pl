extends = /model/basic/radio.pl

flag0 =$ /demo/media/flag0.png
flag1 =$ /demo/media/flag1.png
flag2 =$ /demo/media/flag2.png
flag3 =$ /demo/media/flag3.png

before ==
indsol = randint(0, 3)
flags = [flag0, flag1, flag2, flag3]
flag = flags[indsol]
==

question ==
A quel pays appartient ce drapeau ?
<img class="img img-40" src="{{ flag }}">
==

items ==
France
Espagne
Allemagne
Italie
==