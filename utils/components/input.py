
from components import Component

class Input(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'Input'
        self.type = 'input'
        super().__init__(**kwargs)

    def eval(self):
        if self._sol == self.value:
            self.score = 100
        else:
            self.score = 0
            
    def show(self):
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: green"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"