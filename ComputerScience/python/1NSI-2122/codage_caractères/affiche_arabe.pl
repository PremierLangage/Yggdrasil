
extends = /ComputerScience/python/template/pltest.pl

title= Affiche caractères japonais 

text==


Ecrire une fonction **affiche_hiragane()** qui affiche tous les caractères japonais hiragana unicode.

Ces caractères sont sur le document [joint](https://unicode.org/charts/PDF/U3040.pdf) 

==

taboo=isupper|islower

pltest==
>>> affiche_hiragane()
぀ぁあぃいぅうぇえぉおかがきぎく
ぐけげこごさざしじすずせぜそぞた
だちぢっつづてでとどなにぬねのは
ばぱひびぴふぶぷへべぺほぼぽまみ
むめもゃやゅゆょよらりるれろゎわ
ゐゑをんゔゕゖ゗゘゙゚゛゜ゝゞゟ
==

