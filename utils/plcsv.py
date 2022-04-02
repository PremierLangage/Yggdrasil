import random
from io import StringIO
from csv import DictReader
rd = random.Random()


def csv_choice(f, **kwargs):
    """
    Return a random row from a csv file/string (as a dictionary)
    """

    if isinstance(f, str):
        return rd.choice(list(DictReader(StringIO(f), **kwargs)), k)
    else:
        return rd.choice(list(DictReader(f, **kwargs)))

def csv_sample(f, k, **kwargs):
    """
    Return a random sample from a csv file/string (as a list of dictionaries)
    """
    if isinstance(f, str):
        return rd.sample(list(DictReader(StringIO(f), **kwargs)), k)
    else:
        return rd.sample(list(DictReader(f, **kwargs)), k)

def csv_col(f, col, delimiter=','):
    """
    Return data in sample from a csv file/string (as a list of dictionaries)
    """
    if isinstance(f, str):
        reader = DictReader(StringIO(f), **kwargs)
    else:
        reader = DictReader(f, **kwargs)
    return [row[col] for row in reader]