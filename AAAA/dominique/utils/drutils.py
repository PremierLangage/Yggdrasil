

def raiseifabsent(name):
    if name not in globals():
        raise(" Missing variable :"+name)

