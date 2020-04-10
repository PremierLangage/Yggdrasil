from components import Component
from json import load

json_file = open('keyboards.JSON')
keyboards_JSON = load(json_file)
json_file.close()

class CustomMathInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-input'
        self.decorator = 'CustomMathInput'
        if 'virtualKeyboards' in kwargs:
            keyboards_JSON['virtualKeyboards'] = kwargs['virtualKeyboards']
        self.config = keyboards_JSON
        super().__init__(**kwargs)


