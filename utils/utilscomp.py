import random as rd
from components import MatchList

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

class MatchList(Component):
    def MatchList_loadContent(self,source,target):
        self.nodes = []
        expected = []
        for i in range(len(source)):
            sourceId = "source" + str(i)
            targetId = "target" + str(i)

            self.nodes.append({
                "id": sourceId,
                "content": source[i],
                "source": True,
            })

            self.nodes.append({
                "id": targetId,
                "content": target[i],
                "target": True,
            })
            expected.append({ "source": sourceId, "target": targetId })
        rd.shuffle(self.nodes)
    

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
    
# RadioGroup

def RadioGroup_loadContent(radio,content):
    radio.items=([{"id":str(id),"content":str(item)} for id,item in enumerate(content)])

def RadioGroup_evalByContent(radio,sol):
    return 100
    for item in radio.items:
        if item['content']==sol:
            item['css'] = 'success-state anim-fade'
            if item['id']==radio.selection:
                return 100
    return 0



