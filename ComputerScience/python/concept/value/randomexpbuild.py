

import random


## FIXEME 
## This should be in an module   

## from plpyutils import randomid 


# copyright Dominique Revuz
# pybank pl utils   plbank/python/src/plpyutils.py
# the function defined here are for generating random code


from random import seed, randint


def randletter(allcaps=False):
    if allcaps or randint(0, 99) < 3:  # Don't like CAPS
        return chr(randint(0, 25)+65)
    else:
        return chr(randint(0, 25)+97)


def randdigit():
    """
    >>> seed(2)
    >>> randdigit()
    '0'
    """
    return chr(randint(0, 9) + 48)


def randomid():
    """
    generate a random name correct in term of the identification regex
    Identifiers are unlimited in length. Case is significant.
    [A-Za-z_][0-9A-Za-z_]*
    we will limite size to 8: 1+(0..1)+(0..2)+(0..4)
    probility of having a number <20%
    we don't like CAPS so every letter caps or none
    >>> seed(5)
    >>> randomid()
    'ohbdpmdh'
    >>> seed(2)
    >>> randomid()
    'z44'
    >>> seed(953)
    >>> randomid()
    'VMGBAS'
    """
    ALLCAPS = randint(1, 100) < 5
    NUMBER = randint(1, 100) < 20
    LEN = 1+randint(0, 1)+randint(0, 2)+randint(0, 4)
    s = ""
    for x in range(LEN):
        if x == 0:  # inital not a number
            s += randletter(ALLCAPS)
            continue
        if NUMBER:
            s += randdigit()
        else:
            s += randletter(ALLCAPS)
    return s

########## cut here


def doeval(txt, dotype=False):
    try:
        if dotype:
            txt = "type("+txt+")"
            txt = str(eval(txt))
            return txt[8:-2]
        return eval(txt)
    except Exception as e :
        print(str(e))
        return "Error"


def logicalpair(a, op, b, lops, dotype):
    op1 = random.choice(lops)
    op2 = random.choice(lops)
    txt = "{namea} " + op1 + " {nameb} " + op + " {namea} " + op2 + " {nameb}"
    vtxt = str(a) + op1 + str(b) + " " + op + " " + str(a) + op2 + str(b)
    val = doeval(vtxt,dotype)
    return txt, val, vtxt


def pair(a, op, b, uop,dotype):
    txt = "{namea} %s {nameb}" % (op)
    vtxt = str(a) + " " + op + " " + str(b)
    val = doeval(vtxt,dotype)
    return txt, val, vtxt


def vcount(x,l):
    c=0
    for e in l:
        if x==e:
            c=c+1
    return c

def build(dic):
    if not "seed" in dic:
        import time
        dic['seed'] = str(time.time())
    random.seed(dic['seed'])
    a = random.randint(0, 5)
    if random.randint(0,99) < dic.get("floatpercent",10) : # 10 %  de chance que ce soit un float
        b = random.randint(3, 12) * 0.5
    else:
        b = random.randint(1, 6)
    namea = randomid()
    nameb = randomid()
    dotype='dotype' in dic
    dic['text'] = """
Soit les deux variables **{namea}** et **{nameb}** initialisées \
par les deux lignes suivantes:

        {namea} = {a}
        {nameb} = {b}

associez les expressions et leur valeurs.
    """.format(a=a, b=b, namea=namea, nameb=nameb)
    docops = "docops" in dic
    dolops = "dolops" in dic
    douops = "douops" in dic
    dobops = "dibops" in dic
    ops = ["+", "-", "*", "**", "/", "//", "%", ]
    cops = ["==", "<=", ">=", "!=", ]
    bops = ["|", "&", "^", ]
    uops = ["-", "~", ]
    lops = ["or", "and", ]
    if "num" not in dic:
        dic["num"] = random.randint(3, 6)
    if "ops" in dic:
        ops = dic["ops"]

    if dobops:
        ops.extend(bops)
    if docops:
        ops.extend(cops)

    pairs = {}
    i = 0
    j = 0
    random.shuffle(ops)
    for op in ops:
        if i > int(dic["num"]) or j > int(dic["num"]):
            break
        if douops:
            t, v, vt = pair(a, op, b, random.choice(uops), dotype)
        elif dolops and random.randint(1, 5) < 3:
            t, v, vt = logicalpair(a, random.choice(lops), b, cops, dotype)
        else:
            t, v, vt = pair(a, op, b, None,dotype)
        t = t.format(namea=namea, nameb=nameb)
        if str(v) not in pairs.values() or vcount(v,pairs.values())<2 :  # élimination des valeurs identiques
                i = i + 1
                pairs[t] = str(v)
        else:
            j = j + 1

    dic["pairs"] = pairs
    l = [x for x in pairs.values()]
    random.shuffle(l)
    dic["shufvalues"] = l
    return dic

if __name__ == '__main__':
    d = dict()
    d["dolops"] = True
    d["dotype"] = True
    print(str(build(d)))
