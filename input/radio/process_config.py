
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



