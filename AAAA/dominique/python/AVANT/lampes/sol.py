

from random import randint,choice


def buildfile(filename):
    """Build
    """
    with open(filename, 'w') as f:
        for i in range(1000):
            x = choice(['éteindre','allumer','basculer'])
            a= randint(1,998)
            b= randint(1,998)
            c= randint(a+1,999)
            d= randint(b+1,999)
            print(f"{x} {a},{b} : {c},{d}", file=f)

def doit():
    """
    Crer le fichier "data" et retourne deux pltests
    """
    # Creation du fichier "data" 
    buildfile("data")
    # Cration des pltest retourne deux pltests
    sol1,sol2 = quest()

    
    

    pltest= f"""
    >>> question1() == {sol1} # Question 1 étage 
    True
    """
    pltest2= f"""
    >>> question2() == {sol2} # Question 2 position 
    True
    """
    print(sol1,sol2)
    return pltest,pltest2







def quest():
    s=[]

    for i in range(0,1000):
        ins=[]
        for j in range(0,1000):
            ins.append(0)
        s.append(ins)
    
    ss=[]

    for i in range(0,1000):
        ins=[]
        for j in range(0,1000):
            ins.append(0)
        ss.append(ins)

    with open("data","r") as f:
        for line in f.readlines():
            line = line.strip()
            mm = line.split()
            a,b = mm[1].split(",")
            a,b = int(a),int(b)
            p,q = mm[3].split(",")
            p,q = int(p), int(q)
            for i in range(a,p+1):
                for j in range(b,q+1):
                    if mm[0] == "éteindre" and s[i][j] > 0:
                        s[i][j] -= 1
                    if mm[0] == "éteindre" and ss[i][j] > 0:
                        ss[i][j] = 0
                    if mm[0] == "allumer" :
                        s[i][j] += 1 
                        ss[i][j] = 1 
                    if mm[0] == "basculer" :  
                        s[i][j] += 2
                        ss[i][j] = 1 - ss[i][j]
    nic=0
    noc=0
    for i in range(0,1000):
        for j in range(0,1000):              
            nic += s[i][j]
            noc += ss[i][j]
    return nic,noc

if __name__ == "__main__":
    print(doit()) 
    
    