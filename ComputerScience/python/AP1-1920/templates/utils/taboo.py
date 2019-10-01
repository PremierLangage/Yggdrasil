


import regex as re

def checktaboo(taboo, answer):
    for x in taboo.split('|'):
        if _checktaboo(x,answer):
            return True
    return False

def _checktaboo(taboo, answer):
    """
    regarde l'occurence du mot taboo dans le fichier answer 
    en ne cherchant pas dans les commentaires.
    >>> _checktaboo( "for","for i in ...")
    True
    >>> _checktaboo( "for","#for i in ...")
    False
    >>> _checktaboo( "for","if 'for' i in ...")
    False
    >>> _checktaboo( "for",'if "for" i in ...')
    False
    >>> _checktaboo( "for",'formidable')
    False
    """
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    # FIXME la chaine de carctère ""  letaboo "" est elle trouvée par la regex suivante ? 
    return re.search("(^"+taboo+"\s|[^\"]+"+taboo+"\s)", x) != None

