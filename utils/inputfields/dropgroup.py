from components import Component
import random as rd
import re

class Drop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.droppable = True
        self.cloneable = False
        super().__init__(**kwargs)

class Label(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.droppable = False
        self.cloneable = False
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

    def labels_html(self):
        lst = []
        for label in self.labels:
            selector = label.selector
            cid = label.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        rd.shuffle(lst)
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
                self.drops[i].css = "success-state"
            else:
                num_wrong +=1
                self.drops[i].css = "error-state"

        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

    def display_feedback(self):
        pass

    def hide_feedback(self):
        pass

    def disable(self):
        for drop in self.drops:
            drop.disabled = True
        for label in self.labels:
            label.disabled = True

def process_filledtext(filledtext, name, style):
    """
    Return exercice elements from a filled text.
    
    In the filled text the parts to be replaced by drop zones are between braces.
    """
    sol = []
    counter = 0
    dropblock = ''
    solution = ''
    start = 0
    for m in re.finditer(r"{([^{}]+)}", filledtext):
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