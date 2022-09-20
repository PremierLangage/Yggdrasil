import uuid
from components import Component
import random as rd
import re
from scoring import *

def stripCurly(t):
    """
    >>> stripCurly(" des trucs avec des {} {tt} voila ")
    ' des trucs avec des  tt voila '

    """
    l=t.split('{')
    t= "".join(l)
    l = t.split('}')
    return  "".join(l)
    # Pour le fun : return "".join("".join(t.split('{')).split('}'))
    
class TextSelect(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-text'
        self.decorator = 'CustomTextSelect'
        self.text = ""
        self._sol = []
        super().__init__(**kwargs)
        self.statement =''

    def setStatement(self, s):
        self.statement = s 

    def settext(self, text):
        """
        Set a text in the component after bracketting it.
        """
        self.text = self.bracket(text)

    def setdata_from_text(self,text):
        self.text, self._sol = self.index_bracket(self.bracket(text))
        self.text= stripCurly(self.text)

    def setitems(self,items):
        self.setdata_from_textDR(items[0])

    def setdata_from_textDR(self,text):
        self._sol = [i for i,x in enumerate(text.split(" ")) if x.startswith("{{") and x.endswith("}}")]
        self.text= stripCurly(text)


    @staticmethod
    def bracket(string):
        """
        Bracket a text.

        Parts between square brackets are stripped from these enclosing brackets.
        Parts between curly brackets or double curly brackets are left unchanged.
        In remaining parts, words are enclosed in curly brackets.
        >>> bracket("Bande de [moules] a {gauffres} et à {{cahuettes}}")
        '{Bande} {de} moules {a} {gauffres} {et} {à} {{cahuettes}}'
    
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
        indexselect = [unit['index'] for unit in self.selections]

        right = list(set(indexselect).intersection(set(self._sol)))
        wrong = list(set(indexselect).difference(set(self._sol)))
        missed = list(set(self._sol).difference(set(indexselect)))



        if display:
            self.selections = [{'index': k, 'css': 'success-state'} for k in right]
            self.selections += [{'index': k, 'css': 'error-state '} for k in wrong]
            self.selections += [{'index': k, 'css': 'success-text-unit'} for k in missed]
                          
        if scoring == "AllOrNothing":
            score = all_or_nothing(len(right), len(wrong))
        elif scoring == "RightMinusWrong":
            score = right_minus_wrong(len(right), len(wrong), nbsol=len(self._sol))          
        #elif scoring == "CorrectItems":
        #    score = correct_items(nbright, nbwrong, nbitems=len(self.items))
        elif scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        if disabled:
            self.disabled = True

        return score


