

def raiseifabsent(name, comment=" variable obligatoire"):
    if name not in globals():
        raise Exception(" Missing variable :"+name+comment)


def additems(group, listitem, step):

    group.items = []
    for num,item for enumerate(listitem) :
    group.items.append({
        "id": f"crit{step}_{}",
        "content": "L'auteur a laissé des éléments inutiles ou des fichiers mal identifiés dans ses contenus."
    })
    group.items.append({
        "id": "crit1ok",
        "content": "Les productions transmises et leurs éléments sont corrects et bien identifiés."
    })
    group.items.append({
        "id": "crit1ok+",
        "content": "Les productions transmises sont particulièrement bien structurées et la précision du nommage <br />ne laisse aucun doute sur le contenu des répertoires et fichiers."
    })
    group.items.append({
        "id": "crit1ok++",
        "content": "Les contenus transmis sont à la fois concis et complets. Un maximum d'éléments sont générés <br />automatiquement rendant la production minimale en taille lors de sa diffusion."
    })

    