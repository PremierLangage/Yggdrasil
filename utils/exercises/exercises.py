class Ex:

    def __init__(self, **kwargs):
        self.__Exo__ = True
        self.comp = kwargs.get('input', [])

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
        self.input.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self.input._sol = self.input.items[index]['id']