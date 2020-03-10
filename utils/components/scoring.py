def all_or_nothing(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return 100 if nbwrong == nbsol else 0

def right_minus_wrong(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return int(round(max([(nbright - nbwrong)/nbsol*100,0])))

def correct_items(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return int(round(max([(nbitems - 2*nbwrong)/nbitems*100,0])))

