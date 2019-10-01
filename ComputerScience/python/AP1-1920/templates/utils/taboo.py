


import regex as re

def checktaboo(taboo, answer):
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    # FIXME la chaine de carctère ""  letaboo "" est elle trouvée par la regex suivante ? 
    return re.search("(^"+taboo+"\s|[^\"]+"+taboo+"\s)", x) != None

