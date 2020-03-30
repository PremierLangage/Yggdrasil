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
            for i in range(len(M.col(0))):
                self.matrix.append([{'value': value} for value in M.row(i)])
