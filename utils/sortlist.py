import uuid
from components import Component
import random as rd

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self._order = []
        super().__init__(**kwargs)

    def loadContent(self,content):
        self.items = []
        for i in range(len(source)):
            id = uuid.uuid4()
            self.nodes.append({
                "id": id,
                "content": content[i]
            })
            self._order.append(id)
        rd.shuffle(self.items)

    def eval(self):

