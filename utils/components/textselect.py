import uuid
from components import Component
import random as rd
import re

def bracket_words(string):
    lst=re.findall(r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|\[[^\]]*\]|[^\{\}\[\]]+",string)
    for i in range(len(lst)):
        s=lst[i]
        if s[0]=="[":
            lst[i]=s[1:-1]
        elif s[0]!="{":
            lst[i]=re.sub(r"(\w+)", r"{\1}",s)
    return "".join(lst)
    
def read_text_bracket(string):
    lst=re.findall(r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|[^\{\}]+",string)
    selection=[]
    k=0
    for i in range(len(lst)):
        s=lst[i]
        if s[0]=="{":
            if len(s)> 2 and s[1]=="{":
                selection.append(k)
                lst[i]=s[1:-1]
            k+=1
    
    return ("".join(lst),selection)


class CustomTextSelect(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-text'
        self.decorator = 'CustomText'
        super().__init__(**kwargs)

    def loadtext(self,text):
        self.text,self._indexsol=read_text_bracket(bracket_words(text))

    def eval(self,**kwargs):
        """
        Evaluate the answer stored in the component.
        """

        display = kwargs.get('display', True)

        right,wrong,missed=0,0,0

        for unit in self.selections:
            if unit in self._indexsol:
                right += 1
                if display:
                    unit['css'] = 'success-state'
            else:
                wrong += 1
                if display:
                    unit['css'] = 'error-state'
        for unit in self._indexsol:
            if unit not in self.selections:
                missed += 1
                unit['css'] = 'error-state'

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

        self.disabled = True

        return (score, "")

    def eval(self,**kwargs):
        score=100
        for e in self.selections:
            if e['index'] in self._indexsol:
                e['css'] = "success-state"
            else:
                e['css'] = "error-state"


        return (score,"")

