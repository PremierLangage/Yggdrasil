import random
import exemple

def builddata(filename):
    with open(filename, "w") as file:
        for x in range(random.randint(0, 200)):
            g.write(str(random.randint(x, 2020))+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [x for x in file.readlines()]

def getResults(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

arr = fromFileToList(exemple)
res = getResults(arr)

print(res)