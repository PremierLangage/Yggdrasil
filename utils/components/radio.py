import random as rd
from uuid import uuid4
from components import Component

class CustomRadio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadio'
        super().__init__(**kwargs)

    def loaditems(self, lstcontent):
        """
        Load items in the component.
        """
        self.items = [{"id": uuid4(), "content": content} for content in lstcontent]

    def setsol_index(self, index):
        """
        Set the component solution from an index.
        """
        self._sol=self.items[index]['id']

    def setsol_content(self, content):
        """
        Set the component solution from a content.
        """
        self._sol=next(item['id'] for item in self.items if item['content'] == content)

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def sort(self):
        """
        Sort the component items.
        """
        self.items.sort(key = lambda item : item['content'])

    def eval(self, **kwargs):
        """
        Evaluate the answer stored in the component.
        """

        display = kwargs.get('display', True)

        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                score = 100
                if display:
                    item['css'] = 'success-state'
                    item['content'] += r"<span class='text-success fas fa-check' style='padding-left: 1em'></span>"
            elif id != self._sol and id == self.selection:
                if display:
                    item['css'] = 'error-state'
                    item['content'] += r"<span class='text-danger fas fa-times' style='padding-left: 1em'></span>"
            elif id == self._sol and id != self.selection:
                score = 0
                if display:
                    item['content'] += r"%s <span class='text-success fas fa-check' style='padding-left: 1em'></span>"

        self.disabled = True

        return (score, "")
