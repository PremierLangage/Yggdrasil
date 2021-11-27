from uuid import uuid4

class MathEmbed:

    def __init__(self, **kwargs):
        self.__MathEmbed__ = True
        self.id = kwargs.get('id', str(uuid4()))
        self.value = kwargs.get('value', [])
        self.prefix = kwargs.get('prefix', '')
        self.suffix = kwargs.get('suffix', '')
        self.embed = kwargs.get('embed', '')
        self.disabled = kwargs.get('disabled', False)

    def visual(self, correct):
        if correct:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        else:
            self.suffix = r'<i class="fas fa-times" style="color: red"></i></i>'