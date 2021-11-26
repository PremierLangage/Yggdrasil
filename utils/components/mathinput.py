
class MathInput():

    def __init__(self, **kwargs):
        self.__MathInput__ = True
        self.keypad = []
        self.value = ""
        self.prefix = ""
        if 'inlineShortcuts' in kwargs:
            keyboards_JSON['inlineShortcuts'] = kwargs['inlineShortcuts']
        if 'virtualKeyboards' in kwargs:
            keyboards_JSON['virtualKeyboards'] = kwargs['virtualKeyboards']
        self.config = keyboards_JSON
        super().__init__(**kwargs)



