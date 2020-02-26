import random as rd
from uuid import uuid4
from components import Component

class CustomCheckbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckbox'
        if 'content' in kwargs:
            self.loaditems(kwargs['content'])
        if 'sol_index' in kwargs:
            self.setsol_by_index(sol_index)
        if 'sol_content' in kwargs:
            self.setsol_by_content(sol_content)
        if 'shuffle' in kwargs and kwargs['shuffle']:
            self.shuffle()
        # ajouter right/wrong et sort
        super().__init__(**kwargs)

    def loaditems(self, lstcontent):
        """
        Load items in the component.
        """
        self.items = [{"id": uuid4(), "content": content} for content in lstcontent]

    def setsol_by_index(self, index):
        """
        Set the component solutions from a list of indices.
        """
        if isinstance(index,list):
            self._sol = [self.items[i]['id'] for i in index]
        elif isinstance(index,int):
            self._sol = [self.items[index]['id']]

    def setsol_by_content(self, content):
        """
        Set the component solutions from a list of contents.
        """
        if isinstance(index,list):
            self._sol = [id for id in self.items if self.items['content'] in content]
        elif isinstance(index,str):
            self._sol = [next(item['id'] for item in self.items if item['content'] == content)]

    def loadrw(self, right, wrong, nitems=None, nright=None):
        """
        Load items and set solutions from lists of right and wrong items.
        """
        if nitems is None:
            nitems = len(right)+len(wrong)
        if nright is None:
            nright = len(right)

        self.loaditems(rd.sample(right,nright)+rd.sample(wrong,nitems-nright))

        self.setsol_by_index(list(range(nright)))

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

    def eval(self, display=True, grading="RightMinusWrong", disabled=True):
        """
        Evaluate the answer stored in the component.
        """
        right,wrong,missed=0,0,0

        for item in self.items:
            id = item['id']
            if id in self._sol and item['checked']:
                right += 1
                if display:
                    item['css'] = 'success-state-icon'
                    item['content'] += "<span class='text-success fas fa-check' style='padding-left: 1em'></span>"
            elif id not in self._sol and item['checked']:
                wrong += 1
                if display:
                    item['css'] = 'error-state-icon'
                    item['content'] += r"<span class='text-danger fas fa-times' style='padding-left: 1em'></span>"
            elif id in self._sol and not item['checked']:
                missed += 1
                if display:
                    item['content'] += r"<span class='text-success fas fa-check' style='padding-left: 1em'></span>"
        
        if grading == "AllOrNothing":
            if wrong == 0 and right == 0:
                score = 100
            else:
                score = 0
        elif grading == "RightMinusWrong":
            if right+missed != 0:
                score = max([round((right-wrong)/(right+missed)*100),0])
            else:
                if wrong == 0:
                    score = 100
                else:
                    score = 0              
        elif grading == "CorrectAnswers":
            nitems = len(self.items)
            score = max([round((nitems-2*(wrong+missed))/nitems*100),0])

        if disabled:
            self.disabled = True

        return (score, "")








