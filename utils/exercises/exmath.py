from mathinput import MathInput
from jinja_env import Env

class ExMath:

    def __init__(self, **kwargs):
        self.__Ex__ = "Math"
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
        self.inputblock = Env.from_string(tpl).render(dic)

    def eval(self):
        return self.input.eval()
