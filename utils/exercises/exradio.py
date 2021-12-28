from ex import Ex

class ExRadio(Ex):

    def __init__(self, **kwargs):
        self.__Exo__ = True
        if 'input' in kwargs:
            self.input = kwargs['input']
        else:
            self.input = Radio()
