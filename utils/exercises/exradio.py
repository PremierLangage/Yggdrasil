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
        self.input._sol = self.input.items[index]['id']


        
