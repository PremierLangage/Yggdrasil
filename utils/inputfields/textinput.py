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
        if any([samestrings(self.value, item, **self.evalparam) for item in self.sol]):
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


def edit_distance(s1, s2):
    """Return the edit distance between two strings."""
    if len(s1) > len(s2):
        s1, s2 = s2, s1
    distances = range(len(s1) + 1)
    for index2,char2 in enumerate(s2):
        newDistances = [index2+1]
        for index1, char1 in enumerate(s1):
            if char1 == char2:
                newDistances.append(distances[index1])
            else:
                newDistances.append(1 + min((distances[index1],
                                             distances[index1+1],
                                             newDistances[-1])))
        distances = newDistances
    return distances[-1]