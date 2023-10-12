
# Author: DR@univ-mlv.fr

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Dominique Revuz
title= Retirer le Suffixe 

text==
Ecrire une fonction ``retirersuffix(s, pref)`` qui retourner la chaine  ``s`` privé de son suffixe ``pref``.

Par exemple, pour ``s = "ceci n'est pas une pipe", pref="pipe "``, l'appel ``retirersuffix(s, pref)`` doit retourner ``"ceci n'est pas une "``.

==

tag=ForIn|stringIndex

samplesol==
def retirerprefix(self , prefix) :
    if self.startswith(prefix):
        return self[len(prefix):]
    else:
        return self[:]

def retirersuffix(self, suffix) -> str:
    # suffix='' should not call self[:-0].
    if suffix and self.endswith(suffix):
        return self[:-len(suffix)]
    else:
        return self[:]
==

before==
==

pltest0==
>>> retirersuffix("", "what ever") # Vide
''
>>> retirersuffix('la France','not a suffix') # Ne pas toucher si pas un suffix
'la France'
>>> retirersuffix('la France la chine et la pologne','la pologne')
'la France la chine et '
>>> retirersuffix('la France la chine et la pologne','')
'la France la chine et la pologne'
==


