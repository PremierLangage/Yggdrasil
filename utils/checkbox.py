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
        ansright,answrong,itemright=0,0,0
        for item in self.items:
            if item['id'] in self._sol and item['checked']:
                item['css'] = 'success-state anim-fade'
                ansright+=1
                itemright+=1
            elif item['id'] in self._sol and not item['checked']:
                item['css'] = 'success-state anim-fade'
                answrong+=1
                itemright+=1
            elif not (item['id'] in self._sol) and item['checked']:
                answrong+=1
        score=computeScore(self.grading,len(self.items),ansright,answrong,itemright)
        return(score,"")

def computeScore(grading,nitems,ansright,answrong,itemright):
    if grading=="AllOrNothing":
        if (ansright==itemright) and answrong==0:
            score=100
        else:
            score=0
    elif grading=="RightMinusWrong":
        if ansright==0 and itemright==0:
            score=100
        elif ansright==0 and itemright>0:
            score=0
        else:
            score=max([int((ansright-answrong)/ansright*100),0])
    elif grading=="CorrectAnswers":
            score=max([int((nitems-2*answrong)/nitems*100),0])
    return score

