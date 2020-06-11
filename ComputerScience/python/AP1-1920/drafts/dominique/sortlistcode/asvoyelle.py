
def asvoyelle(s):
    """
    retourne si oui ou non la chaine s contient une voyelle "aeiuoy"
    """
    for v in "aeiuoy":
        if v in s:
            return True
    return False


