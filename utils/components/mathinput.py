from uuid import uuid4

class MathInput():

    def __init__(self, **kwargs):
        self.__MathInput__ = True
        self.id = str(uuid4())
        self.keypad = []
        self.value = ""
        self.prefix = ""



