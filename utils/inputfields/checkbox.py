import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class Checkbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'Checkbox'
        super().__init__(**kwargs)

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
            self.sol = [self.items[i]['id'] for i in index]
        elif isinstance(index,int):
            self.sol = [self.items[index]['id']]


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

    def eval(self):
        """
        Evaluate the answer stored in the component.
        """
        nbright, nbwrong = 0, 0

        for item in self.items:
            id = item['id']
            if id in self.sol and item['checked']:
                nbright += 1
            elif id not in self.sol and item['checked']:
                nbwrong += 1

        if self.scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif self.scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self.sol))          
        elif self.scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.items))
        elif self.scoring == "Custom":
            score = self.custom_scoring(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for item in self.items:
            id = item['id']
            if id in self.sol:
                item['css'] = 'icon-success-after'
            elif id not in self.sol and item['checked']:
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
        Disable the component.
        """
        self.disabled = True