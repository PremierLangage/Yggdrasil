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

        for i in range(len(source)):
            sourceId = str(uuid.uuid4())
            targetId = str(uuid.uuid4())

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
    '''
        self.nodes = []
        for i in range(len(source)):
            sourceId = uuid.uuid4()
            targetId = uuid.uuid4()
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
    '''
    def eval(self):
        error = 0
        for e in self._expected:
            if not in_links(e, self.links):
                error = error + 1

        for e in self.links:
            e['css'] = 'error-state'
            if in_links(e, self._expected):
                e['css'] = 'success-state'

        if error == 0:
            return (100, '')
        else:
            return (0, '')

def in_links(conn, links):
    for e in links:
        if e['source'] == conn["source"] and  e['target'] == conn["target"]:
            return True
    return False

