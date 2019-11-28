# ***************************************************************************
#            UTILITAIRE PYTHON POUR EXERCICES TROUVE FAUTE 
#
# Pour toute suggestion et/ou correction, contacter un informaticien ou
# l'auteur à son adresse mail : nicolas dot borie at u-pem dot fr
#
# ***************************************************************************

import random


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
    
    """
    with open(filename) as f:
        content = f.read()
    tokens = content.split("\n\n")

    sentences = []

    for tok in tokens:
        tok_short = tok[tok.find(":")+2:]
        if "règle" in tok[:tok.find(":")-1]:
            rule_name = tok_short.replace('\n', '')
        elif "description" in tok[:tok.find(":")-1]:
            rule_description = tok_short.replace('\n', '')
        else:
            if len(tok) >= 10:
                tok = tok.split("mauvais : ")[1]
                bad_sentence = (tok.split("bon : ")[0]).replace('\n', '')
                tok = tok.split("bon : ")[1]
                good_sentence = (tok.split("explication : ")[0]).replace('\n', '')
                tok = tok.split("explication : ")[1]
                explaination = tok.replace('\n', '')
                sentences.append(Sentence(bad_sentence, good_sentence, explaination))
                
    return Rule(rule_name, rule_description, sentences)


class Sentence():
    """"
    This class models a sentence with these variant and explaination.
    """
    def __init__(self, bad, good, explain):
        """
        Initialize a sentence.
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

    def validate(self):
        """
        Set `self` to be validated.
        """
        self._valid = True

    def unvalidate(self):
        """
        Set `self` to be unvalidate.
        """
        self._valid = False

    def is_validated(self):
        """
        Return `True` is `self` is validated, return `False` otherwise.
        """
        return self._valid


class Rule():
    """
    A class modeling a rule.
    """
    def __init__(self, name, description, sentences):
        """
        Initialize `self`.
        """
        self._name = name 
        self._description = description
        self._sentences = sentences
        self._valid = False
        self._nb_good = 0
        self._consecutive = 0

    def name(self):
        """
        Return the name of the rule.
        """
        return self._name

    def description(self):
        """
        Return an html/markdown description of the rule.
        """
        return self._description

    def open_sentences(self):
        """
        If all sentences are validated, unvalidate all sentences. 
        """
        is_open = False
        for sentence in self._sentences:
            if not sentence.is_validated():
                is_open = True
        if not is_open:
            for sentence in self._sentences:
                sentence.unvalidate()

    def grade_sentences(self, index, ok=True):
        """
        Grade the sentence indexed by `index` associated to the rule `self` if `ok`,
        otherwise, it will be counted as an error.
        """
        if ok:
            self._consecutive += 1
            self._nb_good += 1
            (self._sentences[index]).validate()
        else:
            self._consecutive = 0

    def random_sentence_index(self):
        """
        Return the index of a not validated sentence belonging to the rule 
        `self`. If all sentences are validated, this will unvalidate all 
        sentences before.
        """
        self.open_sentences()
        i = random.randint(0, len(self._sentences)-1)
        while ((self._sentences[i]).is_validated()):
            i = random.randint(0, len(self._sentences)-1)
        return i


class TrouveFauteExo():
    """
    A class modeling the full game : a set of rule containing each a set
    of sentences.
    """
    def __init__(self, rules, nb_good_to_valid=-1, nb_consecutive=3):
        """
        Initialize self
        """
        self._rules = rules
        self._nb_good_to_valid = nb_good_to_valid
        self._nb_consecutive = nb_consecutive
        self._nb_question = 0
        self._total_good = 0

    def open_rules(self):
        """
        Returns the list of indices indexing not validated rules.
        """
        ans = []
        for i in range(len(self._rules)):
            if self._nb_good_to_valid != -1:
                if (self._rules[i])._nb_good < self._nb_good_to_valid:
                    ans.append(i)
            else:
                if (self._rules[i])._consecutive < self._nb_consecutive:
                    ans.append(i)
        return ans

    def is_finish(self):
        """
        Return `True` if all rules have been validated, return `False` otherwise.
        """
        return (self.open_rules() == [])

    def random_rule_index(self):
        """
        Return a random not validated rule.
        """
        return random.choice(self.open_rules())

    def grade_rule(self, index_rule, index_sentence, ok=True):
        """
        Grade the rule indexed by `index_rule` after an answer of sentence
        indexed by `index_sentence` inside the rule.
        """
        self._nb_question += 1
        self._rules[index_rule].grade_sentences(index_sentence, ok=ok)
        if ok:
            self._total_good += 1

