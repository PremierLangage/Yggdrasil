
"""
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options,
            'extended': extended
            })
"""



def optiondic(l):
    d={}

    for x in l:
        k,v= x.split('=')
        d[k]=v
    return d

def buildlistes(g,b):
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

def buildquestion(question):
    """
    Question 

    """
    if question.get('extended') == False:
        return question
    if question.get('type') == 'TextSelect' :# j'ai pas de syntaxe etendue pour le moment 
        return question 
    try:
        d=optiondic(question.get('options'))
        nb =int(d.get("nb",4))

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
                        bads.extend(eval(defi[1:]))# ensemble des mauvaises réponces 
                else:
                    bads.append(defi)
            #debug question['text']=str(bads)
            bads= random.sample(bads , nb-1) # en choisir n-1
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
                if r[0]=="=" : # Reponce a calculer
                    if index in question.get('index'): # Bonne réponce 
                        goods.extend(eval(r[1:]))
                    else:
                        bads.extend(eval(r[1:]))
                else:
                    if index in question.get('index'): # Bonne réponce 
                        goods.append(r)
                    else:
                        bads.append(r)


            nbg=int(d.get("good",1))
            nbb=int(d.get("bad",3))
            
            bads= random.sample(bads , nbb) # en choisir n-1
            random.shuffle(bads)
            goods=random.sample(goods , nbb) # en choisir n-1
            random.shuffle(goods)
            question['items'],question['index']=buildlistes(goods,bads)

            return question
        
    except Exception as e:
        print("Problème dans votre question ", str(question))
        print(e)
        raise e
    

