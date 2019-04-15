import re

def process_config(config):
    words=re.split(r'(\W+)',config['text'])
    i=0
    html=""
    for w in words:
        if re.match(r'(\W+)', w) is not None:
            html= html + w
        else:
            html= html + "<span id ='"+str(i)+"'>" + w + "</span>"
            i=i+1
    config['htmltextselect']=html

def process_answer(answer,name,config):
    pass
