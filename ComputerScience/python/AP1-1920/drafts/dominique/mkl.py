
import csv, json 
def makemachlistfromcsv(filename, sourcerow="source", targetrow="target"):
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
            MatchListItem.append({"id":"source"+str(n),"content":row[sourcerow], "source": True,
            })
            MatchListItem.append({"id":"target"+str(n),"content":row[targetrow], "target": True,
            })
            expected.append({ "source": "source"+str(n), "target": "target"+str(n) })
        return MatchListItem,expected



