
import csv, json, random

def fromcsv(filename, sourcecol="source", targetcol="target"):
    """
    Warning doesn't work for non mapping data.
    """
    MatchListItem=[]
    expected=[]
    n=789
    d={}
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=';')
        for row in reader:
            n+=1
            MatchListItem.append({"id":"source"+str(n),"content":row[sourcecol], "source": True})
            if row[targetcol] not in d:
                d[row[targetcol]] = "target"+str(n)
                MatchListItem.append({"id":d[row[targetcol]] ,"content":row[targetcol], "target": True})
            expected.append({ "source": "source"+str(n), "target": d[row[targetcol]]})
        return MatchListItem,expected

def getrandomlines(filename="content.csv",number=4, sourcecol="source", targetcol="target", unique=True):
    l=[]
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=',')
        for row in reader:
            l.append((row[sourcecol],row[targetcol]))
    
    if len(l)<number:
        number = len(l)
    random.shuffle(l)
    return l[:number]

def selectionfromtable(table, number=4):
    """
    return a random selection of number elements of table liste 
    table is a list of pairs [(source,target),(source,target),...]
    """
    l=table
    random.shuffle(l)
    l =  l[:min(number,len(l))]
    MatchListItem=[]
    expected=[]
    for n,e in enumerate(l):
            MatchListItem.append({"id":"source"+str(n),"content":e[0], "source": True})
            MatchListItem.append({"id":"target"+str(n),"content":e[1], "target": True})
            expected.append({ "source": "source"+str(n), "target": "target"+str(n) })
    return MatchListItem,expected



def selectionfromcsv(filename, number=4, sourcecol="source", targetcol="target"):
    """
    return a radnom selection of number elements of the file or all the file if the length is less than number
    """
    l=getrandomlines(filename,number,sourcecol,targetcol)
    return selectionfromtable(l,number)




def selectionfromcsvold(filename, number=4, sourcecol="source", targetcol="target"):
    """
    return number elements of the file or all the file if the length is less than number
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





