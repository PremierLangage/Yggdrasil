import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class InputField:
    pass

class Radio(Component, InputField):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'Radio'
        self.selection = None
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
        self._sol = self.items[index]['id']

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
            if id == self._sol and id == self.selection:
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
            if id == self._sol and id == self.selection:
                item['css'] = 'success-state icon-check-after'
            elif id != self._sol and id == self.selection:
                item['css'] = 'error-state icon-times-after'
            elif id == self._sol and id != self.selection:
                item['css'] = 'icon-check-after'

    def disable(self):
        """
        Disable the component.
        """
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"

class Checkbox(Component, InputField):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'Checkbox'
        super().__init__(**kwargs)
        self.statement =''

    def set_items(self, items):
        """
        Load items in the component.
        """
        if isinstance(items, list):
            self.items = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.items = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]

    def set_sol(self, index):
        """
        Set the component solutions from a list of indices.
        """
        if isinstance(index,list):
            self._sol = [self.items[i]['id'] for i in index]
        elif isinstance(index,int):
            self._sol = [self.items[index]['id']]


    def fill_from_rw(self, right, wrong, nbitems=None, nbright=None):
        """
        Set items and solutions from lists of right and wrong items.
        """
        if isinstance(right, str):
            _right_ = right.splitlines()
        elif isinstance(right, list):
            _right_ = right
        else:
            _right_ = [right]

        if isinstance(wrong, str):
            _wrong_ = wrong.splitlines()
        elif isinstance(wrong, list):
            _wrong_ = wrong
        else:
            _wrong_ = [wrong]

        if nbitems is None:
            nbitems = len(_right_) + len(_wrong_)
        if nbright is None:
            nbright = len(_right_)

        self.set_items(rd.sample(_right_, nbright) + rd.sample(_wrong_, nbitems-nbright))

        self.set_sol(list(range(nbright)))

        self.shuffle()

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

    def eval(self, display=True, disabled=True, scoring="RightMinusWrong", custom_scoring=None):
        """
        Evaluate the answer stored in the component.
        """
        nbright, nbwrong = 0, 0

        for item in self.items:
            id = item['id']
            if id in self._sol and item['checked']:
                nbright += 1
                if display:
                    item['css'] = 'success-state icon-check-after'
            elif id not in self._sol and item['checked']:
                nbwrong += 1
                if display:
                    item['css'] = 'error-state icon-times-after'
            elif id in self._sol and not item['checked'] and display:
                item['css'] = 'icon-check-after'
                          
        if scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self._sol))          
        elif scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        elif scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        pass

    def disable(self):
        """
        Disable the component.
        """
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"


class Input(InputField, Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'Input'
        self.type = 'input'
        super().__init__(**kwargs)

    def eval(self):
    # TODO : reprendre les modes d'évaluations
    # plus sophistiqués du modèle input
        if self.sol == self.value:
            self.score = 100
        else:
            self.score = 0
        return self.score
            
    def show(self):
    # deprecated
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'

    def display_feedback(self):
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'

    def hide_feedback(self):
        self.suffix = ""

    def disable(self):
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"

# Numeric field
class Numeric(Input):

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


class MultInputField:

    def eval(self):
        for input in self.inputs:
            input.eval()

        if -1 in [input.score for input in self.inputs]:
            score = -1
            for input in inputs:
                if input.score == -1:
                    input.display_feedback()
                else:
                    input.hide_feedback()
        else:
            score = int(average([input.score for input in self.inputs]))
            for input in inputs:
                input.display_feedback()
                input.disable()
        return score