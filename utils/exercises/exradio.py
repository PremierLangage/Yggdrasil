from ex import Ex

class ExRadio(Ex):

    def __init__(self, **kwargs):
        self.__Exo__ = True
        self.comp = kwargs.get('input', [])
