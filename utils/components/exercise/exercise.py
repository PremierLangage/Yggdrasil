drom component import Component

class Ex:

    count = 0
    instances = []

    def __init__(self, **kwargs):
        self.__Ex__ = True
        self.id = kwargs.get('id', "Ex"+str(Ex.count))
        Ex.count += 1
        Ex.instances.append(self)
        self.evaluator = kwargs.get('evaluator', '')
        self.question = kwargs.get('question', '')
        comp = kwargs.get('comp', '')
        if isinstance(comp, dict):
            self.comp = Component(comp)
        else:
            self.comp = comp

    def eval(self):
        return self.comp.eval()
