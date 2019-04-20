import random

def process_config(config,name):
    config['numsol'] = eval(config['numsol'])
    choices=eval(config['choices'])
    config['choices'] = choices
    nbchoices=len(choices)
    config['nbchoices'] = nbchoices
    permutation=list(range(nbchoices))
    if config['shuffle']=="yes":   
        random.shuffle(permutation)
    config['permutation'] = permutation
    shuffledchoices=[choices[i] for i in permutation]
    config['shuffledchoices']=shuffledchoices

def process_answer(answer,name,config):
    ans0=answer
    answer[name]={}
    permutation=config['permutation']
    answer[name]['num']=[]
    for i in range(len(config['choices'])):
        if name+"_"+str(i) in ans0:
            answer[name]['num'].append(permutation[int(i)])
    if set(answer[name]['num'])==set(config['numsol']):
        answer[name]['eval'] = True
    else:
        answer[name]['eval'] = False




