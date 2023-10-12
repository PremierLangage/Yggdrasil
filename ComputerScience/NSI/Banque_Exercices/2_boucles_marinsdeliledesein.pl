

extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl



title = Y’a des marins sur l’île de Sein qui partent en mer en bateau 

before=


text==

Pour aider les parents de maternelle nous allons leur écrire le texte de la chanson des Marins de l'ile de Sein.  
Il suffira de demander 

    "combien il y a de marin sur l'ile de Sein ? "
    12 
et d'afficher :

    "Y’a 12 marins sur l’île de Sein qui partent en mer en bateau"
    "Y’a 12 marins sur l’île de Sein qui partent en mer en bateau"
    "Et y’en a un qui tombe à l’eau et tra la la la lère"
    "Et y’en a un qui tombe à l’eau et tra la la la lère"
    ...
    "Y’a 2 marins sur l’île de Sein qui partent en mer en bateau"
    "Y’a 2 marins sur l’île de Sein qui partent en mer en bateau"
    "Et y’en a un qui tombe à l’eau et tra la la la lère"
    "Et y’en a un qui tombe à l’eau et tra la la la lère"
    "Y’a plus de marin sur l’île de Sein qui part en mer en bateau"
    "Y’a plus de marin sur l’île de Sein qui part en mer en bateau"
    "Et y’en a plus qui tombe à l’eau et tra la la la lère!"
    "Et y’en a plus qui tombe à l’eau et tra la la la lère!"

==

soluce==
inp = input("combien il y a de marin sur l'ile de Sein ?")
ni= int(inp)

for n in range(ni,1,-1):
    print(f"Y’a {n} marins sur l’île de Sein qui partent en mer en bateau")
    print(f"Y’a {n} marins sur l’île de Sein qui partent en mer en bateau")
    print("Et y’en a un qui tombe à l’eau et tra la la la lère")
    print("Et y’en a un qui tombe à l’eau et tra la la la lère")
print("""Y’a plus de marin sur l’île de Sein qui part en mer en bateau
Y’a plus de marin sur l’île de Sein qui part en mer en bateau
Et y’en a plus qui tombe à l’eau et tra la la la lère!
Et y’en a plus qui tombe à l’eau et tra la la la lère!""")

==

plsoluce==
Test 1 | 1
Test 4 | 4
Test 0 | 0
==

