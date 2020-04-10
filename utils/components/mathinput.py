from json import load

json_file = open('keyboards.JSON')
keyboards_JSON = load(json_file)
json_file.close()

class CustomMathInpu(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-input'
        self.decorator = 'CustomMathInput'
        keyboards_JSON['virtualKeyboards'] = "elementary"
        self.config = keyboards_JSON
        super().__init__(**kwargs)


