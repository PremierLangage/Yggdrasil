from components import Component

class AutoInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'AutoInput'
        super().__init__(**kwargs)

    def eval(self):
    # TODO : reprendre les modes d'évaluations
    # plus sophistiqués du modèle input
        if self.sol == self.value:
            self.score = 100
        else:
            self.score = 0
        return self.score

    def display_feedback(self):
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: var(--sucsess)"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'

    def set_items(self, items):
        if isinstance(items, str):
            self.autocomplete = items.splitlines()
        else:
            self.autocomplete = items

    def hide_feedback(self):
        self.suffix = ""

    def disable(self):
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the component.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"
