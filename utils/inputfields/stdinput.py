import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class Radio(Serializable):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-radio-group', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the list of items used as choices.
        """
        if isinstance(items, list):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]

    def set_sol(self, index):
        """
        Set the solution item by giving its index in the list of items.
        """
        self.sol = self.data['items'][index]['id']

    def shuffle(self):
        """
        Shuffle the items.
        """
        rd.shuffle(self.data['items'])

    def eval(self):
        """
        Evaluate the answer.
        """
        for item in self.data['items']:
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
        for item in self.data['items']:
            id = item['id']
            if id == self.sol:
                item['css'] = 'icon-success-after'
            elif id != self.sol and id == self.data['selection']:
                item['css'] = 'icon-fail-after'

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        for item in self.data['items']:
            s = item['css'] 
            s = s.replace('icon-success-after', '')
            s = s.replace('icon-fail-after', '')
            item['css'] = s

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.data['selector']
        cid = self.data['cid']
        return f"<{selector} cid='{cid}'></{selector}>"


class Checkbox(Serializable):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-checkbox-group', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the items for the list of choices.
        """
        if isinstance(items, list):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]

    def set_sol(self, index):
        """
        Set the solution items from a list of indices.
        """
        if isinstance(index,list):
            self.sol = [self.data['items'][i]['id'] for i in index]
        elif isinstance(index,int):
            self.sol = [self.data['items'][index]['id']]


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
        Shuffle the items.
        """
        rd.shuffle(self.data['items'])


    def eval(self):
        """
        Evaluate the input field.
        """
        nbright, nbwrong = 0, 0

        for item in self.data['items']:
            id = item['id']
            if id in self.sol and item['checked']:
                nbright += 1
            elif id not in self.sol and item['checked']:
                nbwrong += 1

        if self.scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong, len(self.sol))
        elif self.scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self.sol))          
        elif self.scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.data['items']))
        elif self.scoring == "Custom":
            score = self.custom_scoring(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.data['items']))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for item in self.data['items']:
            id = item['id']
            if id in self.sol:
                item['css'] = 'icon-success-after'
            elif id not in self.sol and item['checked']:
                item['css'] = 'icon-fail-after'


    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        for item in self.data['items']:
            s = item['css'] 
            s = s.replace('icon-success-after', '')
            s = s.replace('icon-fail-after', '')
            item['css'] = s

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.data['selector']
        cid = self.data['cid']
        return f"<{selector} cid='{cid}'></{selector}>"