from components import Component
from sympy import Matrix

class MatrixInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-matrix'
        self.decorator = 'MatrixInput'
        super().__init__(**kwargs)

    def set_matrix(self, M):
        """
        Set a matrix.
        """
        self.matrix = []
        if isinstance(M, list):
            for row in M:
                self.matrix.append([{'value': str(value)} for value in row])
        elif isinstance(M, Matrix):
            for i in range(len(M.col(0))):
                self.matrix.append([{'value': str(value)} for value in M.row(i)])

    def set_zeros(self, rows, cols=None):
        """
        Set a matrix.
        """
        if cols == None:
            cols = rows
        self.set_matrix([cols * [0] for _ in range(rows)])

    def get_value(self):
        """
        Set a matrix.
        """
        return [[item['value'] for item in row] for row in self.matrix]
        
