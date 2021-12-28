class Exo:

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