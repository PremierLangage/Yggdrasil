import random,sys

def process_config(config,name):
    choices=eval(config['choices'])
    nbchoices=len(choices)
    if nbchoices < 2:
        print(" can't have a liste of choice with less than 2 elements ",file=sys.stderr)
    permutation=list(range(nbchoices))
    # we can't give the right answer as the shuffled permutation 
    while (permutation==list(range(nbchoices)))
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
    #print(ans0,file=sys.stderr)
    if len(ans0.split(","))<2: # impossible
        answer[name]['eval'] = False
    else:
        for num in ans0.split(','):
            order.append(permutation[int(num)])
        if order==list(range(nbchoices)):
            answer[name]['eval'] = True
        else:
            answer[name]['eval'] = False
    answer[name]['order'] = order



