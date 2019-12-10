
import csv, json, random

def selectionfromcsv(filename, number=4):
    """
    return number elements of the file or all the file if the lenght is less than number
    """
    l=[]
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=';')
        return random.choice(reader)


