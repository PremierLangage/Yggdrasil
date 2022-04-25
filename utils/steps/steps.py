from jinja_env import Env
from basicinput import *
from serializable import Serializable
from uuid import uuid4
import re
import random as rd

class SingleInput(Serializable):

    def __init__(self, **kwargs):
        self.question = ""
        self.feedback = ""
        self.solution = ""
        for k, v in kwargs.items():
            setattr(self, k, v)
        
    def eval(self):
        """
        Evaluate the answer.
        """
        return self.inputfield.eval()

    def display_feedback(self):
        """
        Display visual feedback.
        """
        self.inputfield.display_feedback()

    def hide_feedback(self):
        """
        Display visual feedback.
        """
        self.inputfield.hide_feedback()

    def disable(self):
        """
        Disable the exercise.
        """
        self.inputfield.disabled = True

    def render(self, name, dic):
        """
        Render an attribute.
        """
        setattr(self, name, Env.from_string(getattr(self, name)).render(dic))

class Step(Serializable):

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


