import uuid
import random as rd
from components import Component

class CustomRadioGroup(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadioGroup'
        self.items = []
        super().__init__(**kwargs)

    def loaditems(self, lstcontent):
        for content in lstcontent:
            self.items.append({"id": str(uuid.uuid4()),"content": content})

    def setsol_index(self,index):
        self._sol=self.items[index]['id']

    def setsol_content(self,content):
        self._sol=next(item['id'] for item in self.items if item['content'] in content)

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def eval(self,**kwargs):
        score = 0
        selectedId = self.selection
        for e in self.items:
            if e['id'] == self._sol:
                e['content'] += r"<span class='fas fa-check' style='padding-left: 1em'></span>"
                if e['id'] == selectedId:
                    e['css'] = 'success-state'
                    score = 100
            elif e['id'] == selectedId:
                score = 0
                e['css'] = 'error-state'
                e['content'] += r"<span class='fas fa-times' style='padding-left: 1em'></span>"
        self.disabled=True
        return (score, "")








