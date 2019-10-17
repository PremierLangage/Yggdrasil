import uuid
import random as rd
from components import Component

class CustomCheckBox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadioGroup'
        self.items = []
        super().__init__(**kwargs)

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

    def evalByContent(self,content):
        ansright,answrong=0,0
        for item in self.items:
            if item['content'] in content and item['checked']:
                item['css'] = 'success-state anim-fade'
                ansright+=1
            elif item['content'] in content and not item['checked']:
                item['css'] = 'success-state anim-fade'
                answrong+=1
            elif not (item['content'] in content) and item['checked']:
                answrong+=1
        score=max([int((ansright-answrong)/ansright*100),0])
        return(score,"")
