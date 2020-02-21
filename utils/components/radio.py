import random as rd
from uuid import uuid4
from components import Component

class CustomRadio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadio'
        self.items = []
        self._content = {}
        super().__init__(**kwargs)

    def loaditems(self, lstcontent):
        for content in lstcontent:
            id = str(uuid4())
            self._content[id] = content
            self.items.append({"id": id ,"content": content})

    def setsol_index(self, index):
        self._sol=self.items[index]['id']

    def setsol_content(self, content):
        self._sol=next(item['id'] for item in self.items if item['content'] in content)

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def eval(self, **kwargs):
        """
        Evaluate the answer stored in the component.
        """

        display = kwargs.get('display', True)

        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                if id == self.selection:
                score = 100
                if display:
                    item['css'] = 'success-state'
                    item['content'] = r"%s <span class='text-success fas fa-check' style='padding-left: 1em'></span>" % self._content[id]
            elif id != self._sol and id == self.selection:
                score = 0
                if display:
                    item['css'] = 'error-state'
                    item['content'] = r"%s <span class='text-danger fas fa-times' style='padding-left: 1em'></span>" % self._content[id]
            elif id == self._sol and id != self.selection:
                score = 0
                if display:
                    item['content'] = r"%s <span class='text-success fas fa-check' style='padding-left: 1em'></span>" % self._content[id]

        self.disabled = True

        return (score, "")
