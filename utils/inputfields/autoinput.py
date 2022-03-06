from components import Component

class AutoInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'AutoInput'
        super().__init__(**kwargs)

    def set_items(self, items):
        """
        Set the items for the autocomplete list.
        """
        if isinstance(items, str):
            self.autocomplete = items.splitlines()
        else:
            self.autocomplete = items

    def eval(self):
        """
        Evaluate the input field.
        """
        if self.sol == self.value:
            self.score = 100
        else:
            self.score = 0
        return self.score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: var(--success)"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        self.suffix = ""

    def disable(self):
        """
        Disable the input field.
        """
        self.disabled = True

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.selector
        cid = self.cid
        return f"<{selector} cid='{cid}'></{selector}>"
