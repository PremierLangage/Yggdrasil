from components import Component

class TextInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-input'
        self.decorator = 'TextInput'
        super().__init__(**kwargs)

    def set_sol(self, sol):
        if isinstance(sol, str):
            self.sol = sol.splitlines()
        elif isinstance(sol, lst):
            self.sol = sol

    def eval(self):
        if any([samestrings(ans, item, diffmeasure=diffmeasure, tol=tol) for item in _sol_]):
            self.score = 100
        else:
            self.score = 0
        return self.score      

    def display_feedback(self):
        if self.score == 100:
            self.suffix = r'<i class="fas fa-check" style="color: var(--success)"></i>'
        elif self.score >= 0:
            self.suffix = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'

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


def samestrings(str1, str2, diffmeasure="EditDist", tol=0, casesens=False):
    if not casesens:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
        return edit_distance(str1, str2)/len(str2) <= tol
    else:
        return edit_distance(str1, str2) <= tol