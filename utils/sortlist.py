import uuid
from components import Component
import random as rd
#from scipy.stats import kendalltau
import scipy

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self.grading =[]
        self._order = []
        super().__init__(**kwargs)

    def loadContent(self,content):
        self.items = []
        self._order = []
        for i in range(len(content)):
            id = uuid.uuid4()
            self.items.append({
                "id": id,
                "content": content[i]
            })
            self._order.append(id)
        rd.shuffle(self.items)

    def eval(self):
        errors = 0
        n=len(self.items)
        orderans= [self._order.index(e['id']) for e in self.items]
        for i, e in enumerate(self.items):
            e['css'] = 'success-state animated fadeIn'
            if e['id'] != self._order[i]:
                e['css'] = 'error-state animated fadeIn'
                errors += 1
        tau,_=kendalltau(orderans,list(range(n)))
        score=int(max([0,tau])*100)
        if errors == 0:
            return (score, '<span class="success-state animated pulse infinite">Good answer</span>')
        else:
            return (score, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')


