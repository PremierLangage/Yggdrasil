import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class CustomCheckbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckbox'
        super().__init__(**kwargs)
        self.statement =''

    def setStatement(self, s):
        self.statement = s 

    def setitems(self, items):
        """
        Load items in the component.
        """
        if isinstance(items, list):
            self.items = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.items = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]
    
    def setsol_from_index(self, index):
        """
        Set the component solutions from a list of indices.
        """
        if isinstance(index,list):
            self._sol = [self.items[i]['id'] for i in index]
        elif isinstance(index,int):
            self._sol = [self.items[index]['id']]

    def setindsol(self, index):
        self.setsol_from_index(index)

    def setsol_from_content(self, content):
        """
        Set the component solutions from a list of contents.
        """
        if isinstance(index,list):
            self._sol = [id for id in self.items if self.items['content'] in content]
        elif isinstance(index,str):
            self._sol = [next(item['id'] for item in self.items if item['content'] == content)]

    def setdata_from_rw(self, right, wrong, nbitems=None, nbright=None):
        """
        Set items and solutions from lists of right and wrong items.
        """
        if isinstance(right, str):
            _right_ = right.splitlines()
        elif isinstance(right, list):
            _right_= right

        if isinstance(wrong, str):
            _wrong_ = wrong.splitlines()
        elif isinstance(wrong, list):
            _wrong_ = wrong

        if nbitems is None:
            nbitems = len(_right_) + len(_wrong_)
        if nbright is None:
            nbright = len(_right_)

        self.setitems(rd.sample(_right_, nbright) + rd.sample(_wrong_, nbitems-nbright))

        self.setsol_from_index(list(range(nbright)))

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

        self.disabled = disabled

        return score



