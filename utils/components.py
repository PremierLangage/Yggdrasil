import uuid
from components import Component
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

class CustomMatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'CustomMatchList'
        self.nodes = []
        super().__init__(**kwargs)

    def loadContent(self,source,target):
        self.nodes = []
        self._expected = []
        for i in range(len(source)):
            sourceId = uuid.uuid4()
            targetId = uuid.uuid4()

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
            _expected.append({ "source": sourceId, "target": targetId })
        rd.shuffle(self.nodes)

    def eval(self):
        error = 0
        for e in self.expected:
            if not in_links(e, self.links):
                error = error + 1

        for e in self.links:
            e['css'] = 'error-state anim-fade'
            if in_links(e, selfexpected):
                e['css'] = 'success-state  anim-flip'

        if error == 0:
            return (100, '')
        else:
            return = (0, '')

def in_links(conn, links):
    for e in links:
        if e['source'] == conn["source"] and  e['target'] == conn["target"]:
            return True
    return False


    
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




