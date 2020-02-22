import random as rd
from uuid import uuid4
from components import Component

class CustomCheckbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckbox'
        super().__init__(**kwargs)

    def setsol_index(self,index):
        self._sol=[self.items[i]['id'] for i in index]

    def setsol_content(self,content):
        self._sol=[id for id in self._content if self._content[id] in content]

    def loaditems(self, lstcontent):
        for content in lstcontent:
            id = str(uuid4())
            self._content[id] = content
            self.items.append({"id": id ,"content": content})

    def loadrw(self, right, wrong, nitems, nright):
        self.loaditems(rd.sample(right,nright)+rd.sample(wrong,nitems-nright))
        self.setsol_index(list(range(nright)))
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

    def eval(self, **kwargs):
        """
        Evaluate the answer stored in the component.
        """

        display = kwargs.get('display', True)

        right,wrong,missed=0,0,0

        for item in self.items:
            id = item['id']
            if id in self._sol and item['checked']:
                right += 1
                if display:
                    item['css'] = 'success-state'
                    item['content'] = r"%s <span class='text-success fas fa-check' style='padding-left: 1em'></span>" % self._content[id]
            elif id not in self._sol and item['checked']:
                wrong += 1
                if display:
                    item['css'] = 'error-state'
                    item['content'] = r"%s <span class='text-danger fas fa-times' style='padding-left: 1em'></span>" % self._content[id]
            elif id in self._sol and not item['checked']:
                missed += 1
                if display:
                    item['content'] = r"%s <span class='text-success fas fa-check' style='padding-left: 1em'></span>" % self._content[id]
        
        grading = kwargs.get('grading', "RightMinusWrong")

        if grading == "AllOrNothing":
            if wrong == 0 and right == 0:
                score = 100
            else:
                score = 0
        elif grading == "RightMinusWrong":
            if right+missed == 0:
                if wrong == 0:
                    score = 100
                else:
                    score = 0
            else:
                score = max([round((right-wrong)/(right+missed)*100),0])
        elif grading == "CorrectAnswers":
            nitems = len(self.items)
            score = max([round((nitems-2*(wrong+right))/nitems*100),0])

        self.disabled = True

        return (score, "")





