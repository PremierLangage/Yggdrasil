import random as rd
from uuid import uuid4
from components import Component
from scipy.stats import kendalltau

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self._order = []
        self._feedback = {}
        super().__init__(**kwargs)

    def setdata_from_list(self, lst):
        """
        Load items and set solution from an ordered list.
        """
        self.items = []
        self._order = []
        self._feedback = {}
        for item in lst:
            id = str(uuid4())
            if isinstance(item, tuple):
                self._feedback[id] = item[1]
                self.items.append({"id": id, "content": item[0]})
            else:
                self.items.append({"id": id, "content": item})
            self._order.append(id)
        rd.shuffle(self.items)

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def eval(self, display=True, grading="KendallTau", disabled=True):
        """
        Evaluate the answer stored in the component.
        """

        if display:
            for i, e in enumerate(self.items):
                id=e['id']
                if id == self._order[i]:
                    e['css'] = 'success-state'
                    css_state="success"
                else:
                    e['css'] = 'error-state'
                    css_state="danger"
                if id in self._feedback:
                    e['content']=  """<div class="d-flex justify-content-between align-items-center">
                        <span class="badge badge-%s"> %s </span>
                        <a href="#" onclick="event.preventDefault()" data-toggle="tooltip" class="alert-%s alert-link" title="%s"> % s </a>
                        <span></span>
                    </div>""" % (css_state,str(1+self._order.index(e['id'])), css_state,self._feedback[id],e['content'])
                else:
                    e['content']=  """<div class="d-flex justify-content-between align-items-center">
                        <span class="badge badge-%s"> %s </span>
                        <span> %s </span>
                        <span></span>
                    </div>""" % (css_state,str(1+self._order.index(id)),e['content'])
        
        n = len(self.items)
        order = [self._order.index(item['id']) for item in self.items]

        if grading == "AllOrNothing":
            if order == list(range(n)):
                score = 100
            else:
                score = 0     
        elif grading == "KendallTau":
            tau,_ = kendalltau(order,list(range(n)))
            score = int(round(max([0,tau])*100))

        if disabled:
            self.disabled = True

        return (score, "")


# texte qui bouge quand on déplace un item
# lien du tooltip qui ouvre la racine du site
# disabled qui désactive le tooltip
# extrajs

