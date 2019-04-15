def process_config(config):
    config['tags']={}
    drag=eval(config['drag'])
    drop=eval(config['drop'])
    for name,value in drag.items():
        config['tags'][name]={'type':'drag','value':value}
    for name in drop:
        config['tags'][name]={'type':'drop','value':"    "}

def process_answer(answer,name,config):
    pass

