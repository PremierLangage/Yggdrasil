
def entree_joueurs():
    joueurs=[]
    for i in range (2):
        joueur = input("Entrez le nom du joueur" + str(i))
        joueurs.append(joueur)
    return joueurs

@patch('builtins.input', lambda *args: 'y')