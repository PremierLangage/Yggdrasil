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
