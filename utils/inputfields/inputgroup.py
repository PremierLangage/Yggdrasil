class InputGroup:

    def __init__(self, **kwargs):
        self.__InputGroup__ = True
        self.inputs = kwargs.get('inputs', [])

    def eval(self):

        def average(lst):
            return sum(lst)/len(lst)

        for input in self.inputs:
            input.eval()

        scores = [input.score for input in self.inputs]
        if -1 in scores:
            self.score = -1
        else:
            self.score = int(average(scores))
        return self.score

    def display_feedback(self):
        """
        Display visual/contextual feedback for all inputs in the group.
        """
        if self.score == -1:
            for input in self.inputs:
                if input.score == -1:
                    input.display_feedback()
                else:
                    input.hide_feedback()
        else:
            for input in self.inputs:
                input.display_feedback()

    def disable(self):
        """
        Disable all input fields in the group.
        """
        for input in group.inputs:
            input.disable()