import uuid
from components import Component
import random as rd
import re
from scoring import *

class CustomTextSelect(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-text'
        self.decorator = 'CustomText'
        self.text = ""
        self._sol = []
        super().__init__(**kwargs)

    def settext(self, text):
        """
        Set a text in the component after bracketting it.
        """
        self.text = self.bracket(text)

    def setdata_from_text(self,text):
        self.text, self._sol = self.index_bracket(self.bracket(text))
        
    @staticmethod
    def bracket(string):
        """
        Bracket a text.

        Parts between square brackets are stripped from these enclosing brackets.
        Parts between curly brackets or double curly brackets are left unchanged.
        In remaining parts, words are enclosed in curly brackets.
        """
        # split the text
        pattern = r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|\[[^\]]*\]|[^\{\}\[\]]+"
        lst = re.findall(pattern, string)

        # process the different parts
        for i in range(len(lst)):
            s = lst[i]
            if s[0] == "[":
                lst[i] = s[1:-1]
            elif s[0] == "{":
                pass
            else:
                lst[i] = re.sub(r"(\w+)", r"{\1}", s)

        return "".join(lst)
    
    @staticmethod
    def index_bracket(string):
        """
        Return the indices of the units between double curly brackets.
        """
        pattern = r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|[^\{\}]+"
        lst = re.findall(pattern, string)

        selection = []
        k = 0
        for i in range(len(lst)):
            s = lst[i]
            if s[0] == "{":
                if len(s) > 2 and s[1] == "{":
                    selection.append(k)
                    lst[i] = s[1:-1]
                k += 1
        
        return ("".join(lst), selection)

    def eval(self, display=True, scoring="RightMinusWrong", disabled=True, custom_scoring=None):
        """
        Evaluate the answer stored in the component.
        """
        nbright, nbwrong = 0, 0

        for unit in self.selections:
            if unit['index'] in self._sol:
                nbright += 1
                if display:
                    unit['css'] = 'success-test-unit'
            else:
                nbwrong += 1
                if display:
                    unit['css'] = 'error-text-unit'
                          
        if scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self._sol))          
        elif scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbitems=len(self.items))
        elif scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        if disabled:
            self.disabled = True

        return score

    def evalold(self,**kwargs):
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
        for unit in []: #self._indexsol:
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




