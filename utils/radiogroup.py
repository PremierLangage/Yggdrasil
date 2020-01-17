import uuid
import random as rd
from components import Component

class CustomRadioGroup(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadioGroup'
        self.items = []
        self.content = {}
        super().__init__(**kwargs)

    def loadContent(self, content):
        items = []
        for e in content:
            id = str(uuid.uuid4())
            self.content[id] = e
            self.items.append({"id": id,"content": e})

    def loadChoices(self, content):
        items = []
        for e in content:
            id = str(uuid.uuid4())
            self.content[id] = e
            self.items.append({"id": id,"content": e})

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
                e['content'] = self.content[e['id']] + r"<span class='fas fa-check' style='padding-left: 1em'></span>"
                if e['id'] == selectedId:
                    score = 100
            elif e['id'] == selectedId:
                score = 0
                e['css'] = 'error-state'
                e['content'] = self.content[e['id']] + r"<span class='fas fa-times' style='padding-left: 1em'></span>"
        return (score, "")




