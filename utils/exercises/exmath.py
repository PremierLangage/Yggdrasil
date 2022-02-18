class ExMath(Ex):

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
