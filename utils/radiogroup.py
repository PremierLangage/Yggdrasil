import uuid
import random as rd
from components import Component

class CustomRadioGroup(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadioGroup'
        self.items = []
        super().__init__(**kwargs)

    def loadContent(self, content):
        items = []
        for e in content:
            items.append({
                "id": uuid.uuid4(),
                "content": e
            })
        self.items = items

    def setSolByIndex(self,index):
        self._sol=self.items[index]['id']

    def setSolByContent(self,content):
        self._sol=next(item['id'] for item in self.items if item['content'] in content)

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def eval(self):
        score = 0
        selectedId = self.selection
        for e in self.items:
            if e['id'] == self._sol:
                e['css'] = 'success-state'
                if e['id'] == selectedId:
                    score = 100
            elif e['id'] == selectedId:
                score = 0
                e['css'] = 'error-state'
        return (score, "")

