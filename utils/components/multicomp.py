from customdragdrop import CustomDragDrop

class MultiComp:

    def __init__(self, **kwargs):
        self.__MultiComp__ = True
        self.comp = kwargs.get('comp', [])

class DropGroup(MultiComp):

    def __init__(self, param=None, **kwargs):
        self.__MultiComp__ = "DropGroup"
        self.comp = kwargs.get('comp', [])
        self._sol = kwargs.get('_sol', [])
        if isinstance(param, int):
            self.comp = [CustomDragDrop.Drop() for _ in range(param)]
        elif isinstance(param, list):
            self.comp = [CustomDragDrop.Drop() for _ in range(len(param))]
            self._sol = param
    
    def eval(self):
        n = len(self.comp)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.comp[i].content == self._sol[i]:
                num_right += 1
                self.comp[i].css = "success-state"
            else:
                num_wrong +=1
                self.comp[i].css = "error-state"

        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

class LabelGroup(MultiComp):

    def __init__(self, param=None, **kwargs):
        self.__MultiComp__ = "DropGroup"
        self.comp = kwargs.get('comp', [])
        if isinstance(param, list):
            self.comp = [CustomDragDrop.Label(content) for content in param]

    
