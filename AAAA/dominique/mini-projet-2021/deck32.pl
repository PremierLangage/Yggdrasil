





extends = /ComputerScience/python/template/pltest.pl

title= deck32 un jeux de 32 cartes 

text==

Ecrire la fonction **deck32** correspondant au doctest suivant

```python

    Create a 32  card set   
    heigth in HEIGTH= ( "7", "8", "9","Valet", "Dame", "Roi", "10","As")  
    color in COLOR= ("Coeur", "Carreau", "Trèfle", "Pique")  
  
    returns a list of 32 pairs (heigth, color)
```


==


pltest==
>>> l =deck32(); l.sort() ; l # Test simple 
[('10', 'Carreau'), ('10', 'Coeur'), ('10', 'Pique'), ('10', 'Trèfle'), ('7', 'Carreau'), ('7', 'Coeur'), ('7', 'Pique'), ('7', 'Trèfle'), ('8', 'Carreau'), ('8', 'Coeur'), ('8', 'Pique'), ('8', 'Trèfle'), ('9', 'Carreau'), ('9', 'Coeur'), ('9', 'Pique'), ('9', 'Trèfle'), ('As', 'Carreau'), ('As', 'Coeur'), ('As', 'Pique'), ('As', 'Trèfle'), ('Dame', 'Carreau'), ('Dame', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Roi', 'Pique'), ('Roi', 'Trèfle'), ('Valet', 'Carreau'), ('Valet', 'Coeur'), ('Valet', 'Pique'), ('Valet', 'Trèfle')]
==


