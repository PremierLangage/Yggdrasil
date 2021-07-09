# Input field classes

import random as rd
from uuid import uuid4
from components import Component

# Numeric field
class Numeric(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'Numeric'
        self.type = 'number'
        super().__init__(**kwargs)

    def eval(self):
        if self._sol == self.value:
            self.score = 100
        else:
            self.score = 0
            
    def show(self):
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'

# Radio field
class Radio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'Radio'
        self.selection = None
        super().__init__(**kwargs)
        self.statement =''

    def set_items(self, items):
        """
        Set items in the component.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the solution from the index in the item list.
        """
        self._sol = self.items[index]['id']

    def shuffle(self):
        """
        Shuffle the items.
        """
        rd.shuffle(self.items)

    def eval(self, display=True, disabled=True):
        """
        Evaluate the answer.
        """
        score = 0
        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                score = 100
                if display:
                    item['css'] = 'success-state icon-check-after'
            elif display and id != self._sol and id == self.selection:
                    item['css'] = 'error-state icon-times-after'
            elif display and id == self._sol and id != self.selection:
                    item['css'] = 'icon-check-after'

        self.disabled = disabled

        return score
