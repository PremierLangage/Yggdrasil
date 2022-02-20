
class DragDrop():

    def __init__(self, **kwargs):
        self.__Ex__ = "DragDrop"
        self.drops = kwargs.get('drops', [])
        self.labels = kwargs.get('labels', [])
        self.sol = kwargs.get('sol', [])

    def set_drops(self, n):
        self.labels = [CustomDragDrop.Drop() for _ in range(n)]

    def set_labels(self, lst):
        self.labels = [CustomDragDrop.Label(content=content) for content in lst]

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