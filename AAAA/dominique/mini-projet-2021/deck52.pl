





extends = /ComputerScience/python/template/pltest.pl

title= deck32 un jeux de 32 cartes 

text==

Ecrire la fonction **deck32** correspondant au doctest suivant

```python
    """Create a 32  card set 
    color in ["pique","coeur","carreau","trèfle"]
    height in [7,...,10,"valet","dame","roi"]
    (Color, heigth)
    returns a list of 32 pairs 
    """
```


==


pltest==
>>> deck32() # Test simple 
[('pique', 7), ('pique', 8), ('pique', 9), ('pique', 10), ('pique', 'valet'), ('pique', 'dame'), ('pique', 'roi'), ('coeur', 7), ('coeur', 8), ('coeur', 9), ('coeur', 10), ('coeur', 'valet'), ('coeur', 'dame'), ('coeur', 'roi'), ('carreau', 7), ('carreau', 8), ('carreau', 9), ('carreau', 10), ('carreau', 'valet'), ('carreau', 'dame'), ('carreau', 'roi'), ('trèfle', 7), ('trèfle', 8), ('trèfle', 9), ('trèfle', 10), ('trèfle', 'valet'), ('trèfle', 'dame'), ('trèfle', 'roi')]
==


