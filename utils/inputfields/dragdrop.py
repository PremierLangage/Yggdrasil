
class DragDrop():

    def __init__(self, **kwargs):
        self.__Ex__ = "DragDrop"
        self.drops = kwargs.get('drops', [])
        self.labels = kwargs.get('labels', [])
        self.sol = kwargs.get('_sol', [])

    def set_labels(self, lst):
        self.labels = [CustomDragDrop.Label(content=content) for content in lst]

    def set_filledtext(self, filledtext):
        counter = 0
        newstring = ''
        start = 0
        for m in re.finditer(r"{([^{}]+)}", filledtext):
            end, newstart = m.span()
            newstring += filledtext[start:end]
            self.drops.append(CustomDragDrop.Drop())
            self._sol.append(m.group(1))
            selector = self.drops[counter].selector
            cid = self.drops[counter].cid
            rep = f"<{selector} cid='{cid}'></{selector}>"
            newstring += rep
            start = newstart
            counter += 1
        newstring += filledtext[start:]
        self.drops_template = newstring
    
    def drops_html(self):
        return self.drops_template

    def labels_html(self):
        lst = []
        for label in self.labels:
            selector = label.selector
            cid = label.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        rd.shuffle(lst)
        return "".join(lst)

    def eval(self):
        n = len(self.drops)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.drops[i].content == self._sol[i]:
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

    def show(self):
        pass

    def disable(self):
        pass