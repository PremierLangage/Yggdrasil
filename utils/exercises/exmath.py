from mathinput import MathInput

class ExMath:

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.__Ex__ = "Math"
        self.question = kwargs.get('question', '')
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = MathInput()
            self.inputblock = self.input.render()
            
    def eval(self):
        return self.input.eval()
