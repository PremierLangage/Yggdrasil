
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


def optiondic(l):
    d={}

    for x in l:
        k,v= x.split('=')
        d[k]=v
    return d

def buildquestion(question):
    """
    Question 

    """
    if question.get('extended') == False:
        return question
    try:
        d=optiondic(question.get('options'))
        nb =int(d.get("nb",4))
        if question.get('type') == 'Radio':
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
            question['text']=str(bads)
            bads= random.sample(bads , nb-1) # en choisir n-1
            random.shuffle(bads)
            # INSERER good quelque part et noter l'index 
            index=random.randint(0,len(bads))
            bads.insert(index,good)
            question['index']=index
            question['items']=bads
        return question

        
    except Exception as e:
        print("Problème dans votre question ", str(question))
        print(e)
        raise e
    
