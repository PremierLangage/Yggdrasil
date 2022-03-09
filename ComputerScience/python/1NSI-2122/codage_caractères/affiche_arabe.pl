
extends = /ComputerScience/python/template/pltest.pl

title= Affiche caractères japonais 

text==


Ecrire une fonction **affiche_hiragana()** qui affiche tous les caractères japonais hiragana unicode
par ligne de 16 caractères.

Ces caractères sont sur ce [document](https://unicode.org/charts/PDF/U3040.pdf) 

==

taboo=isupper|islower

pltest==
>>> affiche_hiragana()
぀ぁあぃいぅうぇえぉおかがきぎく
ぐけげこごさざしじすずせぜそぞた
だちぢっつづてでとどなにぬねのは
ばぱひびぴふぶぷへべぺほぼぽまみ
むめもゃやゅゆょよらりるれろゎわ
ゐゑをんゔゕゖ゗゘゙゚゛゜ゝゞゟ
==

