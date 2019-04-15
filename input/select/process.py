import random

def process_config(config):
    config['numsol'] = int(config['numsol'])
    choices=eval(config['choices'])
    config['choices'] = choices
    nbchoices=len(choices)
    config['nbchoices'] = nbchoices
    permutation=list(range(nbchoices))
    if config['shuffle']=="yes":   
        random.shuffle(permutation)
    config['permutation'] = permutation
    shuffledchoices=[choices[i] for i in permutation]
    config['shuffledchoices'] =shuffledchoices

def process_answer(answer,name,config):
    pass

def test():
    ans0=answer
    answer[name]={}
    permutation=config['permutation']
    for i in range(len(config['choices'])):
        if name+"_"+str(i) in ans0:
            answer[name]['num'] = permutation[int(i)]
            break
    if answer[name]['num']==config['numsol']:
        answer[name]['eval'] = True
    else:
        answer[name]['eval'] = False


