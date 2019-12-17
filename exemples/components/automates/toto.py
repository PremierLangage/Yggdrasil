


def completude(tomate):
    """
    vérifier que tout les états ont une transition par toutes les lettres
    """
    alpha=tomate['alphabet']
    states=tomate['states']
    transitions=tomate["transitions"]
    ts=[]
    for t in transitions:
        for x in t['symbols']:
            ts.append((t['fromState'],t['toState'],x)) 
    return str(ts)
