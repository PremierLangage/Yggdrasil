
class MultiComp:

    count = 0
    instances = []

    def __init__(self, **kwargs):
        self.__MultiComp__ = True
        self.comp = kwargs.get('comp', [])