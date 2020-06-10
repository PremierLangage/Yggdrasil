def compte(lst):
    """ Compte le nombre d'entiers pairs dans la liste d'entiers lst
    >>> compte([2, 3])
    1
    """
    nb, pos = 0, 0
    while pos < len(lst):
        if lst[pos] % 2 == 0:
            nb += 1
        pos += 1
    return nb
