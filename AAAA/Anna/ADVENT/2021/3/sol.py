import random
import re

def builddata():
    tab = []
    val = random.randint(0, 20)
    strnb = []
    for x in range(1000):
        for y in range(val):
            strnb.append(str(random.randint(0, 1)))
    return tab.append('\n'.join([ str(v) for v in strnb]))

def ToList(filec):
    return [int(x) for x in filec.split('\n')] 

def Question1(array):
    isIncreased = 0
    for i in range(1, len(array)):
        if array[i] > array[i-1]:
            isIncreased += 1
    return isIncreased

def Question2(array):
    isIncreased = 0
    for i in range(3, len(array)):
        a = array[i - 3] + array[i - 2] + array[i - 1]
        b = array[i - 2] + array[i - 1] + array[i]
        if a < b:
            isIncreased += 1
    return isIncreased




