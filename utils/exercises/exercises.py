from radio import Radio
from checkbox import Checkbox
from uuid import uuid4

class Ex:

    def __init__(self, **kwargs):
        self.input = kwargs.get('input', None)
        self.question = kwargs.get('question', '')
        self.inputblock = kwargs.get('inputblock', '')

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
        self.__Ex__ = "Radio"
        if not 'input' in kwargs:
            self.input = Radio()
            self.inputblock = self.input.render()
        super().__init__(**kwargs)
            
    def set_items(self, items):
        """
        Set the list of items.
        """
        self.input.set_items(items)

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self.input.set_sol(index)
        
class ExCheckbox(Ex):

    def __init__(self, **kwargs):
        self.__Exo__ = "Checkbox"
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = self.input.render()
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