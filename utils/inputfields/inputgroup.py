class InputGroup:

    def __init__(self, **kwargs):
        self.__InputGroup__ = True
        self.inputs = kwargs.get('inputs', [])

    def eval(self):

        def average(lst):
            return sum(lst)/len(lst)

        for input in self.inputs:
            input.eval()

        if -1 in [input.score for input in self.inputs]:
            score = -1
            for input in self.inputs:
                if input.score == -1:
                    input.display_feedback()
                else:
                    input.hide_feedback()
        else:
            score = int(average([input.score for input in self.inputs]))
            for input in self.inputs:
                input.display_feedback()
                input.disable()
        return score
