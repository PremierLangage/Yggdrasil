def process_config(config,name):
    config['tags']={}
    drag=eval(config['drag'])
    drop=eval(config['drop'])
    cloneable=config['cloneable']
    style=config['style']
    globalname=name
    for name,text in drag.items():
        config['tags'][globalname+'_'+name]={'type':'drag','text':text,'value':name,'style':style,'cloneable':cloneable}
    for name,text in drop.items():
        config['tags'][globalname+'_'+name]={'type':'drop','value':"",'style':style}

def process_answer(answer,name,config):
    drag=eval(config['drag'])
    drop=eval(config['drop'])
    for key in drag:
        answer.pop(name+'_'+key)
    dic={}
    score=0
    for key,value in drop.items():
        dic[key]=answer.pop(name+'_'+key)
        if dic[key]==value:
            score+=1
    score=int(100*score/len(drop))
    answer[name]={}
    answer[name]['score']=score
    answer[name]['drop']=dic


