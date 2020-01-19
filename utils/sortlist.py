import uuid
from components import Component
import random as rd
from scipy.stats import kendalltau

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
            id = str(uuid.uuid4())
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
            s=str(self._order.index(e['id']))+ ". "
            e['content']=  """<li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-primary badge-pill">2</span>
            </li>"""
            #e['content']=r"<span class='badge badge-primary badge-pill'>2</span>" + e['content']
            e['css'] = 'success-state animated fadeIn'
            if e['id'] != self._order[i]:
                e['css'] = 'error-state animated fadeIn'
                errors += 1
        tau,_=kendalltau(orderans,list(range(n)))
        score=round(max([0,tau])*100)
        return (score,str(score))




