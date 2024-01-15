def creer_occurences(texte):
    d = {}
    for caractere in texte:
        d[caractere] = d.get(caractere, 0) + 1
    return d

class Feuille:
    def __init__(self, lettre, valeur):
        self.valeur = valeur
        self.lettre = lettre

class Arbre:
    def __init__(self, valeur):
        self.valeur = valeur
        self.droite = None
        self.gauche = None

def creer_liste_triee(occurences):
    lst = []
    while len(occurences) != 0:
        m = -1
        for k, v in occurences.items():
            if v > m:
                m = v
                km = k
        lst.append(Feuille(km, m))
        del occurences[km]
    return lst

def insere(lst, noeud):
    if len(lst) != 0:
        i = len(lst) - 1
        while noeud.valeur > lst[i].valeur and i >= 0:
            i -= 1
        lst.insert(i + 1, noeud)  
    else:
        lst.insert(0, noeud)

def arbre_huffman(lst):
    i = 0
    while len(lst) > 1:
        i += 1
        noeud1 = lst.pop()
        noeud2 = lst.pop()
        nouveau_noeud = Arbre(noeud1.valeur + noeud2.valeur)
        nouveau_noeud.gauche = noeud1
        nouveau_noeud.droite = noeud2
        insere(lst, nouveau_noeud)
    return lst[0]

def table_encodage(arbre, code = ""):
    d = {}
    if isinstance(arbre, Feuille):
        d[arbre.lettre] = code
        d[code] = arbre.lettre
        return d
    d.update(table_encodage(arbre.gauche, code + "0"))
    d.update(table_encodage(arbre.droite, code + "1"))
    return d

def codage(texte, hufdict):
    ret = ""
    for carac in texte:
        ret += hufdict[carac]
    return ret

def decodage(code, hufdict):
    texte = ""
    caraccode = ""
    for bit in code:
        caraccode += bit
        if caraccode in hufdict:
            texte += hufdict[caraccode]
            caraccode = ""
    return texte

textes = ["c'est un test", "salut les nsi", """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.\nUt velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.\n\nAliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet.""", "Je suis trop fort et je veux faire de grandes études" ]
