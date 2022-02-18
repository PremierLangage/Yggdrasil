from jinja_env import Env
from inputfields import Radio, Checkbox
from input import Input
from uuid import uuid4
from customdragdrop import CustomDragDrop
import re
import random as rd

class Ex:

    def __init__(self, **kwargs):
        self.question = kwargs.get('question', '')
        self.feedback = kwargs.get('feedback', '')
        self.solution = kwargs.get('solution', '')

    def eval(self):
        """
        Evaluate the answer.
        """
        return self.input.eval()

    def show(self):
        #deprecated
        """
        Display visual feedback.
        """
        self.input.show()

    def display_feedback(self):
        """
        Display visual feedback.
        """
        self.input.display_feedback()

    def hide_feedback(self):
        """
        Display visual feedback.
        """
        self.input.hide_feedback()

    def disable(self):
        """
        Disable the exercise.
        """
        self.input.disabled = True

    def render(self, name, dic):
        """
        Render an attribute.
        """
        setattr(self, name, Env.from_string(getattr(self, name)).render(dic))

class ExRadio(Ex):

    def __init__(self, **kwargs):
        self.__Ex__ = "Radio"
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = Radio()
            self.inputblock = self.input.render()
        #super().__init__(**kwargs)
            
    def set_items(self, items):
        """
        Set the list of items.
        """
        self.input.set_items(items)

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self.input.set_sol(index)

class ExCheckbox(Ex):

    def __init__(self, **kwargs):
        self.__Ex__ = "Checkbox"
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = Checkbox()
            self.inputblock = self.input.render()

    def set_items(self, items):
        """
        Set the list of items.
        """
        self.input.set_items(items)

    def set_sol(self, index):
        """
        Set the solutions from a list of indices.
        """
        self.input.set_sol(index)

class ExInput(Ex):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.__Ex__ = "Input"
        self.question = kwargs.get('question', '')
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = Input()
            self.inputblock = self.input.render()
            
    def eval(self):
        return self.input.eval()

class ExDragDrop(Ex):

    def __init__(self, **kwargs):
        self.__Ex__ = "DragDrop"
        self.drops = kwargs.get('drops', [])
        self.labels = kwargs.get('labels', [])
        self._sol = kwargs.get('_sol', [])
        self.question = kwargs.get('question', '')
        self.inputblock = kwargs.get('inputblock', '')
        self.drops_template = kwargs.get('drops_template', '')

    def set_labels(self, lst):
        self.labels = [CustomDragDrop.Label(content=content) for content in lst]

    def set_filledtext(self, filledtext):
        counter = 0
        newstring = ''
        start = 0
        for m in re.finditer(r"{([^{}]+)}", filledtext):
            end, newstart = m.span()
            newstring += filledtext[start:end]
            self.drops.append(CustomDragDrop.Drop())
            self._sol.append(m.group(1))
            selector = self.drops[counter].selector
            cid = self.drops[counter].cid
            rep = f"<{selector} cid='{cid}'></{selector}>"
            newstring += rep
            start = newstart
            counter += 1
        newstring += filledtext[start:]
        self.drops_template = newstring
    
    def drops_html(self):
        return self.drops_template

    def labels_html(self):
        lst = []
        for label in self.labels:
            selector = label.selector
            cid = label.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        rd.shuffle(lst)
        return "".join(lst)

    def eval(self):
        n = len(self.drops)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.drops[i].content == self._sol[i]:
                num_right += 1
                self.drops[i].css = "success-state"
            else:
                num_wrong +=1
                self.drops[i].css = "error-state"

        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

    def show(self):
        pass

    def disable(self):
        pass
