
extends = /ComputerScience/python/template/pltest.pl

title= Affiche caractères japonais 

text==


Ecrire une fonction **affiche_hiragana()** qui affiche tous les caractères japonais hiragana unicode
par ligne de 16 caractères.

Ces caractères sont sur ce [document](https://unicode.org/charts/PDF/U3040.pdf) 

==

taboo=isupper|islower

reponse==
def affiche_hiragana():
    cmpt = 0
    ligne = ""
    for i in range(0x3040, 0x309F + 1):
        ligne += chr(i)
        cmpt += 1
        if cmpt == 16:
            print(ligne)
            cmpt = 0
            ligne = ""
==

pltest==
>>> affiche_hiragana()
぀ぁあぃいぅうぇえぉおかがきぎく
ぐけげこごさざしじすずせぜそぞた
だちぢっつづてでとどなにぬねのは
ばぱひびぴふぶぷへべぺほぼぽまみ
むめもゃやゅゆょよらりるれろゎわ
ゐゑをんゔゕゖ゗゘゙゚゛゜ゝゞゟ
==

