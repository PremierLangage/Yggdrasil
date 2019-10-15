import random as rd

def checkradio(radio,idsol):
    S=radio.selection
    for item in radio.items:
        if item['id'] == S:
            if S == idsol:
                item['css'] = 'success-state'
                return (100,"")
            else:
                item['css'] = 'error-state'
        elif item['id'] == idsol:
            item['css'] = 'success-state'
    return (0,"")

# MatchList

def MatchList_loadContent(match,source,target):
    match.nodes = []
    expected = []
    for i in range(len(source)):
        sourceId = "source" + str(i)
        targetId = "target" + str(i)

        match.nodes.append({
            "id": sourceId,
            "content": source[i],
            "source": True,
        })

        match.nodes.append({
            "id": targetId,
            "content": target[i],
            "target": True,
        })
        expected.append({ "source": sourceId, "target": targetId })
    rd.shuffle(match.nodes)
    


