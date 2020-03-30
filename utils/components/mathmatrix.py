from components import Component
from sympy import Matrix
class CustomMathMatrix(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-matrix'
        self.decorator = 'CustomMathMatrix'
        super().__init__(**kwargs)

    def setmatrix(self, M):
        """
        Set a matrix.
        """
        self.matrix = []
        if isinstance(M, Matrix):
            for row in M.row:
                self.matrix.append([{'value': value} for value in row])
