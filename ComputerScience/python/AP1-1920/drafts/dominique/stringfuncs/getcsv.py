
import csv, json, random

def selectionfromcsv(filename, number=4):
    """
    return number elements of the file or all the file if the lenght is less than number
    """
    
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=';')
        l=[x for x in reader]
        return random.choice(l,4)


