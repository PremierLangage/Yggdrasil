import random

def process_config(config):
    choices=eval(config['choices'])
    nbchoices=len(choices)
    permutation=list(range(nbchoices))
    random.shuffle(permutation)
    shuffledchoices=[choices[i] for i in permutation]
    config['nbchoices'] = nbchoices
    config['choices'] = choices
    config['shuffledchoices'] =shuffledchoices
    config['permutation'] = permutation

def process_answer(answer,name,config):
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

