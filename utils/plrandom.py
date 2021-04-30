import random
from itertools import chain, islice
from io import StringIO
from csv import DictReader
rd = random.Random()

def randint(a, b, excval=[]):
    """
    Return a random integer between two bounds (excluding some values).
    """
    item=rd.choice(range(a,b+1))
    while item in excluded_values:
        item=rd.choice(range(a,b+1))
    return item

def sampleint(a, b, k, excval=[]):
    """
    Return a random integer between two bounds (excluding some values).
    """
    # Le passage par des listes n'est pas super.
    bound = [a]
    bound.extend(sorted(excval))
    bound.append(b)
    lst = []
    for i in range(len(bound)-1):
        lst.extend(list(range(bound[i], bound[i+1])))
    return rd.sample(lst, k)


def csv_choice(f, delimiter=','):
    """
    Return a random row from a csv file/string (as a dictionary)
    """

    if isinstance(f, str):
        return rd.choice(list(DictReader(StringIO(f), delimiter=delimiter)), k)
    else:
        return rd.choice(list(DictReader(f, delimiter=delimiter)))

def csv_sample(f, k, delimiter=','):
    """
    Return a random sample from a csv file/string (as a list of dictionaries)
    """
    if isinstance(f, str):
        return rd.sample(list(DictReader(StringIO(f), delimiter=delimiter)), k)
    else:
        return rd.sample(list(DictReader(f, delimiter=delimiter)), k)