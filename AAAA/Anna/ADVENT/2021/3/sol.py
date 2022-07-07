import random
import re

def builddata():
    tab = []
    val = random.randint(0, 20)
    strnb = []
    for x in range(1000):
        for y in range(val):
            strnb.append(str(random.randint(0, 1)))
        tab.append('\n'.join([ str(v) for v in strnb]))
    return tab

