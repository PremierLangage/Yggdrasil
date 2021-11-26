from uuid import uuid4

class MathInput:

    def __init__(self, **kwargs):
        self.__MathInput__ = True
        self.id = kwargs.get('id', str(uuid4()))
        self.keypad = kwargs.get('keypad', [])
        self.value = kwargs.get('value', '')
        self.prefix = kwargs.get('prefix', '')
        self.disabled = kwargs.get('disabled', False)