import uuid
from components import Component
import random as rd

class CustomMatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'CustomMatchList'
        self.nodes = []
        self._sol = []
        super().__init__(**kwargs)

    def loadpairs(self,pairs):
        """
        Load matched pairs of items in the component.
        """ 
        for source,target in pairs:
            sourceid = str(uuid.uuid4())
            targetid = str(uuid.uuid4())
            self.nodes.append({
                "id": sourceid,
                "content": source[i],
                "source": True
            })
            self.nodes.append({
                "id": targetid,
                "content": target[i],
                "target": True
            })
        self._sol.append({ "source": sourceid, "target": targetid })
        rd.shuffle(self.nodes)

    def eval(self):
        """
        Evaluate the answer stored in the component.
        """ 
        error = 0
        for e in self.nodes:
            if 'source' in e and e['source']:
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



