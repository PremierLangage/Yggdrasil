import Random

def buildradio(text, good,bads):
    s=""
    s+= f"* {text} \n"
    l=[f"+ {good}"]
    for b in bads:
        l.append(f"- {b}")
    Random.shuffle(l)
    s+= "\n".join(l)
    s+="\n\n"
    return s




