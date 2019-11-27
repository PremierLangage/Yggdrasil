# ***************************************************************************
#            UTILITAIRE PYTHON POUR EXERCICES TROUVE FAUTE 
#
# Pour toute suggestion et/ou correction, contacter un informaticien ou
# l'auteur à son adresse mail : nicolas dot borie at u-pem dot fr
#
# ***************************************************************************


def diff_detect(s1, s2):
    """
    Return the list of indices of words different in sentences `s1` and `s2`.
    This function is closed to assume that s1 and s2 has the same lenght.
    """
    indices = []
    token1 = s1.split(' ')
    token2 = s2.split(' ')
    i = 0
    while i<len(token1) and i<len(token2):
        if token1[i] != token2[i]:
            indices.append(i)
        i += 1
    return indices

def parse_file(filename):
    """
    Parse the orthographe file rule whose name is `filename`.

    Return a Python dictionnary of the following shape
    rule_name : "name of the rule"
    rule_description : "text describing the rule"
    sentences : [("bad sentence", "good sentence", "explain error")]
    """
    d = {}
    with open(filename) as f:
        content = f.read()
    tokens = content.split("\n\n")
    d["sentences"] = []
    for tok in tokens:
        tok_short = tok[tok.find(":")+2:]
        if "règle" in tok[:tok.find(":")-1]:
            d["rule_name"] = tok_short
        elif "description" in tok[:tok.find(":")-1]:
            d["rule_description"] = tok_short
        else:
            if len(tok) >= 10:
                tok = tok.split("mauvais : ")[1]
                bad_sentence = (tok.split("bon : ")[0]).replace('\n', '')
                tok = tok.split("bon : ")[1]
                good_sentence = (tok.split("explication : ")[0]).replace('\n', '')
                tok = tok.split("explication : ")[1]
                explaination = tok.replace('\n', '')
                d["sentences"].append( (bad_sentence, 
                                        good_sentence, 
                                        explaination, 
                                        diff_detect(bad_sentence, good_sentence)) )
    return d


class Sentence():
    """"
    This class models a sentence with these variant and explaination.
    """
    def __init__(self, bad, good, explain):
        """
        Initialize a sentence
        """
        self._bad = bad
        self._good = good
        self._explain = explain
        self._valid = False

    def __str__(self):
        """
        Return a string describing `self`.
        """
        return "mauvais : "+self._bad+"\nbon : "+self._good+"\nexplication : "+self._explain

    def diff_indices(self):
        """
        Return the list of index one should select on the bad sentence.
        """
        return diff_detect(self._bad, self._good)

        
