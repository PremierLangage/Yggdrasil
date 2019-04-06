


import csv
import random 

def get(path, delimiter=';', level=1):
    """
    
    >>> get("data.csv",";",1)
    barkljhahrj
    """
    images = {}
    with open(path,'r') as csvf:
        reader = csv.DictReader(csvf, delimiter=';')
        if level in [1,2]:
            alpha='1'
        else: 
            alpha='2'
        l2 = [x for x in reader]
        l= [x for x in l2 if x['alphabeta']==alpha ]

        return random.choice(l)

def getenonce(level=1,t=1): #  type 1 demiq, type 2 oxred 
    """
    >>> getenonce(level=1,t=1)
    
    """
    # add %$ %$ to the drafs 
    dico = get("data.csv",";",level)

    if t==1:
        enonce=" A partir de la demi equation redox donnee "+ dico['demieq']
    else:
        enonce=" Pour le couple redox suivant "+oxred 
    
    enonce += " remplir la formule de Nernst avec les étiquettes proposées" 
    dico['rep']= [ int(x) for x in dico['reponse'].split(',')]
    del dico['reponse']
    dico['drags']= dico['drags'].split(',')
    dico['text']=enonce 
    return dico
    


#    for k in dico:
#        globals()[k]=dico[k]

