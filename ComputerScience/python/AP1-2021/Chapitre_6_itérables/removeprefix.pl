# Author: DR@univ-mlv.fr

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Dominique Revuz
title= Retirer le préfix 

text==
Ecrire une fonction ``retirerprefix(s, pref)`` qui retourner la chaine  ``s`` privé de son préfix ``pref``.

Par exemple, pour ``s = "ceci n'est pas une pipe", pref="ceci "``, l'appel ``retirerprefix(s, pref)`` doit retourner ``"n'est pas une pipe"``.

==

tag=ForIn|stringIndex

samplesol==
def retirerprefix(self: str, prefix: str, /) -> str:
    if self.startswith(prefix):
        return self[len(prefix):]
    else:
        return self[:]

def removesuffix(self: str, suffix: str, /) -> str:
    # suffix='' should not call self[:-0].
    if suffix and self.endswith(suffix):
        return self[:-len(suffix)]
    else:
        return self[:]
==

before==
==

pltest0==
>>> retirerprefix("", "what ever") # Vide
''
>>> retirerprefix('la France','not a prefix') # Ne pas toucher si pas un prefix
'la France'
>>> retirerprefix('la France la chine et la pologne','la France ') # 
'la chine et la pologne'
>>> retirerprefix('la France la chine et la pologne','') # prefix vide
'la France la chine et la pologne'
==


