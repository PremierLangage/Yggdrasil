from uuid import uuid4

class Ex:

    count = 0
    instances = []

    def __init__(self, **kwargs):
        self.__Ex__ = True
        self.id = kwargs.get('id', "Ex"+str(Ex.count))
        Ex.count += 1
        Ex.instances.append(self)
        self.evaluator = kwargs.get('evaluator', '')

    def eval(self):
        return self.comp
