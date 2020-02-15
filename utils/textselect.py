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


class CustomText(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-text'
        self.decorator = 'CustomText'
        super().__init__(**kwargs)

    def loadtext(self,text):
        self.text,self._indexsol=read_text_bracket(bracket_words(text))

    def eval(self):
        self.text,self._indexsol=read_text_bracket(bracket_words(text))
        return (score,"")
