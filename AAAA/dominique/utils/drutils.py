

def raiseifabsent(name, comment=" variable obligatoire"):
    if name not in globals():
        raise Exception(" Missing variable :"+name+comment)


def additems(group, listitem):
    


    