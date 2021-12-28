from radio import Radio
from checkbox import Checkbox
from input import Input
from uuid import uuid4
from customdragdrop import CustomDragDrop

class Ex:

    def __init__(self, **kwargs):
        self.question = kwargs.get('question', '')

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
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = Radio()
            self.inputblock = self.input.render()
        #super().__init__(**kwargs)
            
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
            self.input = Checkbox()
            
    def set_items(self, items):
        """
        Set the list of items.
        """
        self.input.set_items(items)

    def set_sol(self, index):
        """
        Set the solutions from a list of indices.
        """
        self.input.set_sol(index)

class ExInput(Ex):

    def __init__(self, **kwargs):
        self.__Ex__ = "Input"
        if 'input' in kwargs:
            self.input = kwargs['input']
            self.inputblock = kwargs.get('inputblock', '')
        else:
            self.input = Input()
            self.inputblock = self.input.render()
        #super().__init__(**kwargs)
            
    def eval(self):
        if self.input.value == self.input._sol:
            return 100
        else:
            return 0

class ExDragDrop(Ex):

    def __init__(self, **kwargs):
        self.__Ex__ = "DragDrop"
        self.drops = kwargs.get('drops', [])
        self.labels = kwargs.get('labels', [])
        self._sol = kwargs.get('_sol', [])
        #super().__init__(**kwargs)
    
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
            rep = "{ }"
            newstring += rep
            start = newstart
            counter += 1
        newstring += filledtext[start:]
        self.embed = newstring
            
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
