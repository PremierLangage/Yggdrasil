from uuid import uuid4

class MathInput:

    count = 0

    def __init__(self, **kwargs):
        self.__MathInput__ = True
        self.id = kwargs.get('id', "MathInput"+str(Mathinput.count))
        Mathinput.count += 1
        self.keypad = kwargs.get('keypad', [])
        self.value = kwargs.get('value', '')
        self.prefix = kwargs.get('prefix', '')
        self.suffix = kwargs.get('suffix', '')
        self.disabled = kwargs.get('disabled', False)

    def visual(self, correct):
        if correct:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        else:
            self.suffix = r'<i class="fas fa-times" style="color: red"></i></i>'