from jinja_env import Env
from radio import Radio
from checkbox import Checkbox
from textinput import TextInput
from numinput import NumInput
from dropgroup import DropGroup


from uuid import uuid4
import re
import random as rd

class Step:

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

class StepRadio(Step):

    def __init__(self, **kwargs):
        self.__Step__ = "Radio"
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

class StepCheckbox(Step):

    def __init__(self, **kwargs):
        self.__Step__ = "Checkbox"
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

class StepTextInput(Step):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.__Step__ = "Input"
        self.question = kwargs.get('question', '')
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = TextInput()
            self.inputblock = self.input.render()
            
    def eval(self):
        return self.input.eval()

class StepDropGroup(Step):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.__Step__ = "DropGroup"
        self.question = kwargs.get('question', '')
        self.inputblock = kwargs.get('inputblock', '')
        if 'input' in kwargs:
            self.input = kwargs['input']
        else:
            self.input = DropGroup()
            
    def eval(self):
        return self.input.eval()


