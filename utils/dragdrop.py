from components import Component

class CustomDrag(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDrag'
        self.content = "1"
        super().__init__(**kwargs)

