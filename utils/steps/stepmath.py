from mathinput import MathInput
from jinja_env import Env

class StepMath:

    def __init__(self, **kwargs):
        self.__Step__ = "Math"
        self.question = kwargs.get('question', '')
        self.solution = kwargs.get('solution', '')
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
            self.inputblock_tpl = kwargs.get('inputblock_tpl', '')
        else:
            self.input = MathInput()
            self.inputblock = self.input.render()
            self.inputblock_tpl = kwargs.get('inputblock_tpl', '')

    def set_inputblock(self, tpl, dic):
        self.inputblock_tpl = tpl
        self.inputblock = Env.from_string(tpl).render(dic)

    def update(self, dic):
        if self.inputblock_tpl == "":
            self.inputblock = Env.from_string(tpl).render(dic)
        else:
            self.inputblock = Env.from_string(self.inputblock_tpl).render(dic)

    def eval(self):
        return self.input.eval()
