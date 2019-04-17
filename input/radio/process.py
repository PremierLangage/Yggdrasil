import random

def process_config(config):
    if 'processed' not in config:
        config['processed']=True
        config['numsol'] = int(config['numsol'])
        choices=eval(config['choices']) # pourquoi eval ? C'est une clé PL, donc une string.
        config['choices'] = choices
        config['nbchoices'] = len(choices)
        config['permutation'] = random.shuffle(list(range(nbchoices))) if  config['shuffle']=="yes" else list(range(nbchoices))
        shuffledchoices=[choices[i] for i in config['permutation']]
        config['shuffledchoices']=shuffledchoices

def process_answer(reponse,name,config):
    answer[name]={}
    permutation=config['permutation']
    for i in range(len(config['choices'])):
        if name+"_"+str(i) in reponse:
            answer[name]['num'] = permutation[int(i)]
            break
    if answer[name]['num']==config['numsol']:
        answer[name]['eval'] = True
    else:
        answer[name]['eval'] = False
    




