import mkl

def getrandomselection(filename="content.csv", number=4,sourcecol="source", targetcol="target"):

    data = getrandomlines(filename,number,sourcecol, targetcol)
    l=[]
    sol=[]
    for i,d in enumerate(data):
        l.append({
            "id": str(i),
            "content": d[0]
        })
        sol.append(d[1])
    return l,sol 



