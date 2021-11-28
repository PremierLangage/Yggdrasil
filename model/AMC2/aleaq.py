
"""
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options,
            'extended': extended
            })
"""


import random
from collections import defaultdict

def onefromeachgroup(questions, nbpergroup):
    """
    >>> a=onefromeachgroup([{"options":["group=1"]},{"options":["group=1"]},{"options":[],"moules":"frittes"},{"options":["group=toto"]}])
    >>> a == [{'options': [], 'moules': 'frittes'}, {'options': ['group=1']}, {'options': ['group=toto']}]    
    True
    
    """
    nogroup=[]
    # organisation des questions en groupes
    groups= defaultdict(list)
    for q in questions:
        G= [ x[6:] for x in q.get('options',[]) if x.startswith('group=') ]
        if len(G)==0:
            nogroup.append(q)
        else:# si il y a deux groupes définis pour une question la question peut apparaitre deux fois 
            for ng in G:
                groups[ng].append(q)
    # création de la sélection de nbpergroup questions par groupes
    for gl in groups.values():
        nogroup.append(random.sample(gl,min(len(gl),nbpergroup)))
    return nogroup

def getmultioption(q):
    return int(optiondic(q["options"]).get("nbq",1))

def optiondic(l):
    d={}

    for x in l:
        k,v= x.split('=')
        d[k]=v
    return d

def buildlistes(g,b):
    """
    Création d'une liste fusionné avec choix aléatoire de l'ordre d'ajout 
    des élements des deux listes.
    """
    index=0
    r,ri=[],[]
    while g and b:
        if random.random()>0.5:
            r.append(g.pop())
            ri.append(index)
        else:
            r.append(b.pop())
        index=index+1
    if g:
        while g:
            r.append(g.pop())
            ri.append(index)
            index=index+1
    if b:
        r.extend(b)
    return r,ri

def buildquestion(questionp):
    """
    Question 

    """
    #if question.get('extended') == False:
    #    return question
    question=dict(questionp)
    try:
        
        d=optiondic(question.get('options'))
        nb =int(d.get("nb",4))
        if questionp.get('type') == 'TextSelect' :# j'ai pas de syntaxe etendue pour le moment 
            return questionp 
        if question.get('type') == 'Radio' :
            bonne=question.get('index')
            labonne=question.get('items')[bonne]
            if labonne[0]=="=" :
                good=random.choice(eval(labonne[1:]))# Une bonne réponce le [1:] c'est pour le '=' c'est bof FIXME 
            else:
                good=labonne # question standard
            del question.get('items')[bonne]
            bads=[]
            for defi in question.get('items'):
                if defi.startswith("="):
                        bads.extend(eval(defi[1:]))# ensemble des mauvaises réponses 
                else:
                    bads.append(defi)
            #debug question['text']=str(bads)
            bads= random.sample(bads ,min(len(bads), nb-1)) # en choisir n-1
            random.shuffle(bads)
            # INSERER good quelque part et noter l'index 
            index=random.randint(0,len(bads))
            bads.insert(index,good)
            question['index']=index
            question['items']=bads
            return question
        if question.get('type') == 'Checkbox':
            goods,bads=[],[]

            for index,answer in enumerate(question.get('items')):
                r=question.get('items')[index]
                if r[0]=="=" : # Reponse a calculer
                    if index in question.get('index'): # Bonne réponse 
                        goods.extend(eval(r[1:]))
                    else:
                        bads.extend(eval(r[1:]))
                else:
                    if index in question.get('index'): # Bonne réponse 
                        goods.append(r)
                    else:
                        bads.append(r)

            nbg=int(d.get("nbg",len(goods)))
            nbb=int(d.get("nbb",len(bads)))

            bads= random.sample(bads ,min(len(bads),nbb)) 
            random.shuffle(bads)
            goods=random.sample(goods ,min(len(goods), nbg))
            random.shuffle(goods)
            question['items'],question['index']=buildlistes(goods,bads)

            return question
        
    except Exception as e:
        print("Problème dans votre question ", str(question))
        print(e)
        raise e
    






