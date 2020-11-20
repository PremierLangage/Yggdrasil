
import csv, json, random
def fromcsv(filename, sourcecol="source", targetcol="target"):
    """
    Warning doesn't work for non mapping data.
    """
    MatchListItem=[]
    expected=[]
    n=789
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=';')
        for row in reader:
            n+=1
            MatchListItem.append({"id":"source"+str(n),"content":row[sourcecol], "source": True})
            MatchListItem.append({"id":"target"+str(n),"content":row[targetcol], "target": True})
            expected.append({ "source": "source"+str(n), "target": "target"+str(n) })
        return MatchListItem,expected


def selectionfromcsv(filename, number=4, sourcecol="source", targetcol="target"):
    """
    return number elements of the file or all the file if the lenght is less than number
    """
    l=[]
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=';')
        for row in reader:
            l.append((row[sourcecol],row[targetcol]))
    if len(l)<number:
        number = len(l)
    random.shuffle(l)
    MatchListItem=[]
    expected=[]
    for n in range(number):
            MatchListItem.append({"id":"source"+str(n),"content":l[n][0], "source": True})
            MatchListItem.append({"id":"target"+str(n),"content":l[n][1], "target": True})
            expected.append({ "source": "source"+str(n), "target": "target"+str(n) })
    return MatchListItem,expected


testfile="""target;source;bob;bib
one;un;1:I
two:deux;2;II
trois:three;3;III
quatre:four;4;IV
cinq;five;5;V
"""

if __name__ == "__main__" :
    """
    >>> with open("test.csv","w") as f:
        f.write(testfile)
    >>> random.seed(56)
    >>> selectionfromcsv("test.csv")
    
    """ 
