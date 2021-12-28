from ex import Ex

class ExRadio(Ex):

    def __init__(self, **kwargs):
        self.__Exo__ = True
        if 'input' in kwargs:
            self.input = kwargs['input']
        else:
            self.input = Radio()
            
    def set_items(self, items):
        """
        Set the list of items.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self._sol = self.items[index]['id']

    def shuffle(self):
        """
        Shuffle the list of items.
        """
        rd.shuffle(self.items)

    def fill(self, items, indsol=0, shuffled=True):
        """
        Set the list of items and the solution.
        """
        self.set_items(items)
        self.set_sol(indsol)
        if shuffled:
            self.shuffle()

    def eval(self):
        """
        Evaluate the answer.
        """
        return self.input.eval()

    def show(self):
        """
        Display visual feedback.
        """
        self.input.show()

    def disable(self):
        """
        Disable the component.
        """
        self.input.disabled = True            
