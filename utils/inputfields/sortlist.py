import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class SortList(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'SortList'
        self.items = []
        self._sol = []
        super().__init__(**kwargs)

    def set_data_from_list(self, lst):
        """
        Load items and set solution from an ordered list.
        """
        self.items = []
        self._sol = []
        for content in lst:
            id = str(uuid4())
            self.items.append({"id": id, "content": content})
            self._sol.append(id)
        rd.shuffle(self.items)

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def eval(self):
        """
        Evaluate the answer stored in the component.
        """       
        order = [self._sol.index(item['id']) for item in self.items]

        if scoring == "ExactOrder":
            score = exact_order(order)
        elif scoring == "KendallTau":
            score = kendall_tau(order)         
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    
    def display_feedback(self):
        """
        Display visual feedback.
        """
        for i, e in enumerate(self.items):

            id = e['id']

            if id == self._sol[i]:
                e['css'] = 'success-state'
                css_state="success"
            else:
                e['css'] = 'error-state'
                css_state="danger"

            e['content']=  """<div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-%s"> %s </span>
                    <span> %s </span>
                    <span></span>
                </div>""" % (css_state,str(1+self._sol.index(id)),e['content'])


    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        pass


    def disable(self):
        """
        Disable the component.
        """
        self.disabled = True

