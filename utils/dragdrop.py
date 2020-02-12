from components import Component

class Drop(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDrag'
        self.droppable = True
        super().__init__(**kwargs)

class Label(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDrag'
        self.droppable = False
        super().__init__(**kwargs)


