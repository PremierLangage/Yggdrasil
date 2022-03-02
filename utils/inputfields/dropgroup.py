from components import Component
import random as rd
import re

class Drop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.droppable = True
        self.cloneable = False
        self.score = None
        super().__init__(**kwargs)

class Label(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.droppable = False
        self.cloneable = False
        self.score = None
        super().__init__(**kwargs)


class DropGroup():

    def __init__(self, **kwargs):
        self.__DropGroup__ = True
        self.drops = kwargs.get('drops', [])
        self.labels = kwargs.get('labels', [])
        self.sol = kwargs.get('sol', [])

    def set_drops(self, n):
        self.drops = [Drop() for _ in range(n)]

    def set_labels(self, lst):
        self.labels = [Label(content=content) for content in lst]

    def shuffle(self):
        rd.shuffle(self.labels)

    def labels_html(self):
        lst = []
        for label in self.labels:
            selector = label.selector
            cid = label.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        return "".join(lst)

    def drops_html(self):
        lst = []
        for label in self.drops:
            selector = label.selector
            cid = label.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        return "".join(lst)

    def eval(self):
        n = len(self.drops)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.drops[i].content == self.sol[i]:
                num_right += 1
                self.drops[i].score = 100
            else:
                num_wrong +=1
                self.drops[i].score = 0
        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

    def display_feedback(self):
        for drop in self.drops:
            if drop.score is None:
                score = self.score
            else:
                score = drop.score
            if score == 100:
                drop.css = "success-state"
            else:
                drop.css = "error-state"

    def hide_feedback(self):
        pass

    def disable(self):
        for drop in self.drops:
            drop.disabled = True
        for label in self.labels:
            label.disabled = True

    def get_value(self):
        return [drop.content for drop in self.drops]

def process_filledtext(filledtext, delimiters, name, style):
    """
    Return exercice elements from a filled text.
    
    In the filled text the parts to be replaced by drop zones are between defined delimiters.
    """
    sol = []
    counter = 0
    dropblock = ''
    solution = ''
    start = 0
    d0, d1 = delimiters
    pattern = d0 + "([^" + d0 + d1 + "]+)" + d1
    for m in re.finditer(pattern, filledtext):
        end, newstart = m.span()
        dropblock += filledtext[start:end]
        solution += filledtext[start:end]
        rep = "{{ "+ name + "[" + str(counter) + "]|component }}"
        sol.append(m.group(1)) 
        dropblock += rep
        solution += rf'<span style="{style}">{m.group(1)}</span>' 
        start = newstart
        counter += 1
    dropblock += filledtext[start:]
    return sol, dropblock, solution