import re
import random

def process_config_radio(config):
    choices=config['choices'].splitlines()
    if config['shuffle']=="yes":
        nbchoices=len(choices)
        order=list(range(nbchoices))
        random.shuffle(order)
        newchoices=[]
        for k in order:
            newchoices.append(choices[k])
        config['choices'] = newchoices
    else:
        config['choices'] = choices

def process_config_selectwords(config):
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
