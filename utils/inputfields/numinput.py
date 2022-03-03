from components import Component

class NumInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'NumInput'
        self.type = 'number'
        self.evalparam = {}
        self.feedback = kwargs.get('feedback', '')
        super().__init__(**kwargs)

    def eval(self):
        diffmeasure = self.evalparam.get('diffmeasure', 'AbsError')
        tol = self.evalparam.get('tol', 0)
        if diffmeasure == 'AbsError':
            diff = abs(self.sol - self.value)
        elif diffmeasure == 'RelError':
            diff = abs(self.sol - self.value)/abs(self.sol)
        if diff <= tol:
            self.score = 100
        else:
            self.score = 0
        return self.score

    def display_feedback(self):
        msg = self.feedback
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: var(--success)"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'
            self.suffix = rf"""<i class="fas fa-times" style="margin-left: 0.5em; color: #E53935; cursor: pointer;" data-toggle="popover" data-placement="bottom" data-content="{msg}"></i>"""
    
    def hide_feedback(self):
        self.suffix = ""

    def disable(self):
        """
        Disable the input field.
        """
        self.type = 'text' # HACK : doesn't work when the type is 'number'
        self.value = str(self.value)
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"
