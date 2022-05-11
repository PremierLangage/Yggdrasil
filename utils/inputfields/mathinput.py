from uuid import uuid4
from evalsympy import eval_expr, eval_numeric, eval_complex, eval_poly, eval_set, eval_tuple
from evalsympy import eval_interval, eval_chainineq
from evalsympy import eval_matrix
from sympy import Matrix
from jinja2 import Template
from serializable import Serializable

std_keypad = {
    "emptyset": {"label": "$! \\varnothing !$", "action": "cmd", "value": "\\empty"},
    "cup": {"label": "$! \\cup !$", "action": "cmd", "value": "\\cup"},
    "sqrt": {"label": "$! \\sqrt{\\phantom{x}} !$", "action": "cmd", "value": "\\sqrt"},
    "infty": {"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"},
    "+infty": {"label": "$! +\\infty !$", "action": "write", "value": "+\\infty"},
    "-infty": {"label": "$! -\\infty !$", "action": "write", "value": "-\\infty"}
}

class MathInput(Serializable):

    message = {}

    def __init__(self, **kwargs):
        #self.__MathInput__ = True
        self.id = kwargs.get('id', "MathInput" + str(uuid4().hex))
        self.keypad = kwargs.get('keypad', [])
        self.value = kwargs.get('value', '')
        self.prefix = kwargs.get('prefix', '')
        self.suffix = kwargs.get('suffix', '')
        self.embed = kwargs.get('embed', '')
        self.disabled = kwargs.get('disabled', False)
        self.sol = kwargs.get('sol', None)
        self.type = kwargs.get('type', 'expr')
        self.evalmode = kwargs.get('evalmode', 'auto')
        self.evalparam = kwargs.get('evalparam', {})

    def set_keypad(self, keypad):
        """Add a keypad to the input field."""
        self.keypad = keypad
        for i, val in enumerate(keypad):
            if isinstance(val, str):
                self.keypad[i] = std_keypad[val]

    def set_embed(self, embed):
        self.embed = embed.replace("#", r"\MathQuillMathField{}")

    def display_feedback(self):
        """Display the feedback of the input field."""
        score = self.score
        msg = self.feedback
        if score == 100:
            self.suffix = r'<i class="fas fa-check" style="margin-left: 0.5em; color: #43A047"></i>'
        elif score == -1:
            self.suffix = rf"""<i class="fas fa-exclamation-circle" style="margin-left: 0.5em; color: #FFB300; cursor: pointer;" data-toggle="popover" data-placement="bottom" data-content="{msg}"></i>"""
        else:
            self.suffix = rf"""<i class="fas fa-times" style="margin-left: 0.5em; color: #E53935; cursor: pointer;" data-toggle="popover" data-placement="bottom" data-content="{msg}"></i>"""
    
    def hide_feedback(self):
        """Hide the feedback of the input field."""
        self.suffix = ""

    def eval(self):
        """Evaluate the input field."""
        if self.evalmode == "custom":
            self.eval_custom()
        else:
            self.eval_auto()
        return self.score

    def eval_auto(self):
        """Evaluate the input field according to its type."""
        if self.type == "expr":
            score, error = eval_expr(self.value, self.sol, **self.evalparam)
        elif self.type == "numeric":
            score, error = eval_numeric(self.value, self.sol, **self.evalparam)
        elif self.type == "complex":
            score, error = eval_complex(self.value, self.sol, **self.evalparam)
        elif self.type == "poly":
            score, error = eval_poly(self.value, self.sol, **self.evalparam)
        elif self.type == "set":
            score, error = eval_set(self.value, self.sol, **self.evalparam)
        elif self.type == "tuple":
            score, error = eval_tuple(self.value, self.sol, **self.evalparam)
        elif self.type == "interval":
            score, error = eval_interval(self.value, self.sol, **self.evalparam)
        elif self.type == "chainineq":
            score, error = eval_chainineq(self.value, self.sol, **self.evalparam)
        self.score = score
        self.feedback = MathInput.message.get(error, f"Error: {error}")

    def disable(self):
        """Disable the input field."""
        self.disabled = True

    def render(self):
        id = self.id
        prefix = self.prefix
        suffix = self.suffix
        keypad = self.keypad
        value = self.value
        embed = self.embed
        if self.disabled:
            cls_disabled = "mq-disabled"
            disabled = "disabled"
        with open('mathinput.html') as f:
            html = f.read()
        return Template(html).render(locals())

    def get_value(self):
        return self.value

class MatrixInput(Serializable):

    message = {}

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-math-matrix', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_matrix(self, M):
        """
        Set a matrix.
        """
        self.data['matrix'] = []
        if isinstance(M, list):
            for row in M:
                self.data['matrix'].append([{'value': str(value)} for value in row])
        elif isinstance(M, Matrix):
            for i in range(len(M.col(0))):
                self.data['matrix'].append([{'value': str(value)} for value in M.row(i)])

    def set_zeros(self, rows, cols=None):
        """
        Set a matrix of zeros.
        """
        if cols == None:
            cols = rows
        self.set_matrix([cols * [0] for _ in range(rows)])

    def get_value(self):
        """
        Get the matrix.
        """
        return [[item['value'] for item in row] for row in self.data['matrix']]


    def eval(self):
        """
        Evaluate the input field.
        """
        score, error = eval_matrix(Matrix(self.get_value()), self.sol, **self.evalparam)
        self.score = score
        self.feedback = MatrixInput.message.get(error, f"Error: {error}")
        return self.score
        
    def display_feedback(self):
        """
        Display visual feedback.
        """
        pass

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.data['selector']
        cid = self.data['cid']
        return f"<{selector} cid='{cid}'></{selector}>"
