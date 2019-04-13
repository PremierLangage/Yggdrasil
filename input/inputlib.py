import re
import random

def process_config_mathexpr(config):
    pass
    
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

def process_config_sortlist(config):
    choices=eval(config['choices'])
    nbchoices=len(choices)
    permutation=list(range(nbchoices))
    random.shuffle(permutation)
    shuffledchoices=[choices[i] for i in permutation]
    config['nbchoices'] = nbchoices
    config['choices'] = choices
    config['shuffledchoices'] =shuffledchoices
    config['permutation'] = permutation

def process_answer_sortlist(answer,name,config):
    ans0=answer[name]
    answer[name]={}
    permutation=config['permutation']
    nbchoices = config['nbchoices']
    order=[]
    for num in ans0.split(','):
        order.append(permutation[int(num)])
    if order==list(range(nbchoices)):
        answer[name]['eval'] = True
    else:
        answer[name]['eval'] = False
    answer[name]['order'] = order

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





