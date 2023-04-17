

def raiseifabsent(name, comment=" variable obligatoire"):
    if name not in globals():
        raise(" Missing variable :"+name+comment)


