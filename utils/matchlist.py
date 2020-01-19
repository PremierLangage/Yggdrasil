import uuid
from components import Component
import random as rd

class CustomMatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'CustomMatchList'
        self.nodes = []
        self._expected = []
        super().__init__(**kwargs)

    def loadContent(self,source,target):

        self.nodes = []
        for i in range(len(source)):
            sourceId = str(uuid.uuid4())
            targetId = str(uuid.uuid4())
            self.nodes.append({
                "id": sourceId,
                "content": source[i],
                "source": True
            })
            self.nodes.append({
                "id": targetId,
                "content": target[i],
                "target": True
            })
            self._expected.append({ "source": sourceId, "target": targetId })
        rd.shuffle(self.nodes)

    def eval(self):
        error = 0
        for e in self.nodes:
            if 'source' not in e or e['source']:
                if source_link(e['id'],self.links,self._expected):
                    e['css'] = 'success-state'
                else:
                    e['css'] = 'error-state'
                    error = error + 1

        if error == 0:
            return (100, '')
        else:
            return (0, '')

def source_link(sourceId,links1,links2):
    targetId1=""
    targetId2=""
    for e in links1:
        if e['source']==sourceId:
            targetId1=e['target']
            break
    for e in links2:
        if e['source']==sourceId:
            targetId2=e['target']
            break
    return targetId1==targetId2

