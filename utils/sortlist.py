import uuid
from components import Component
import random as rd

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self.grading =[]
        self._order = []
        super().__init__(**kwargs)

    def loadContent(self,content):
        self.items = []
        self._order = []
        for i in range(len(content)):
            id = uuid.uuid4()
            self.items.append({
                "id": id,
                "content": content[i]
            })
            self._order.append(id)
        rd.shuffle(self.items)

    def eval(self):
        errors = 0
        for i, e in enumerate(self.items):
            e['css'] = 'success-state animated fadeIn'
            if e['id'] != self._order[i]:


