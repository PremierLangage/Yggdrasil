import uuid
import random as rd
from components import Component

class Checkbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckboxGroup'
        self.items = []
        self._sol = []
        self.grading = 'AllOrNothing'
        super().__init__(**kwargs)

    def setSolByIndex(self,index):
        self._sol=[self.items[i]['id'] for i in index]

    def setSolByContent(self,content):
        self._sol=[item['id'] for item in self.items if item['content'] in content]

    def loadContent(self, content):
        items = []
        for e in content:
            items.append({
                "id": uuid.uuid4(),
                "content": e
            })
        self.items = items

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def eval(self):
        checkright,checkwrong,missright=0,0,0

        for item in self.items:
            if item['id'] in self._sol and item['checked']:
                item['css'] = 'success-state'
                checkright+=1
            elif item['id'] in self._sol and not item['checked']:
                item['css'] = 'success-border2'
                missright+=1
            elif not (item['id'] in self._sol) and item['checked']:
                item['css'] = 'error-state'
                checkwrong+=1

        if self.grading=="AllOrNothing":
            if checkwrong==0 and missright==0:
                score=100
            else:
                score=0
        elif self.grading=="RightMinusWrong":
            if checkright+missright==0:
                if checkwrong==0:
                    score=100
                else:
                    score=0
            else:
                score=max([int((checkright-checkwrong)/(checkright+missright)*100),0])
        elif self.grading=="CorrectAnswers":
            nitems=len(self.items)
            score=max([int((nitems-2*(checkwrong+missright))/nitems*100),0])
        return (score,"")


