import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class Radio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'Radio'
        #self.selection = None
        super().__init__(**kwargs)

    def set_items(self, items):
        """
        Set the list of items.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self.sol = self.items[index]['id']

    def shuffle(self):
        """
        Shuffle the list of items.
        """
        rd.shuffle(self.items)

    def fill(self, items, indsol=0, shuffled=True):
        """
        Set the list of items and the solution.
        """
        self.set_items(items)
        self.set_sol(indsol)
        if shuffled:
            self.shuffle()

    def eval(self):
        """
        Evaluate the answer.
        """
        for item in self.items:
            id = item['id']
            if id == self.sol and id == self.selection:
                self.score = 100
                return 100
        self.score = 0
        return 0

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for item in self.items:
            id = item['id']
            if id == self.sol:
                item['css'] = 'icon-success-after'
            elif id != self.sol and id == self.selection:
                item['css'] = 'icon-fail-after'

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        for item in self.items:
            s = item['css'] 
            s = s.replace('icon-success-after', '')
            s = s.replace('icon-fail-after', '')
            item['css'] = s

    def disable(self):
        """
        Disable the input field.
        """
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"
