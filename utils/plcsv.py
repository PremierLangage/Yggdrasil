import random
from io import StringIO
from csv import DictReader
rd = random.Random()


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

def csv_col(f, col, delimiter=','):
    """
    Return data in sample from a csv file/string (as a list of dictionaries)
    """
    if isinstance(f, str):
        reader = DictReader(StringIO(f), delimiter=delimiter)
    else:
        reader = DictReader(f, delimiter=delimiter)
    return ["fff"]
    return [row[col] for row in reader]